# -*- coding: utf-8 -*-
module Putit
  module ActsAsUploaded
    extend ActiveSupport::Concern

    DEFAULT = {
      :directory => '/',
    }

    module InstanceMethods
      def generate_subdir_path(arg)
        case arg
        when Proc
          generate_subdir_path(arg.call(self))
        when Array
          Pathname(arg.join('/')).cleanpath.to_s
        when String
          Pathname(arg).cleanpath.to_s
        else
          raise 'Invalid option value.'
        end
      end
    end

    module ClassMethods
      attr_reader :uploaded
      
      after_create = lambda do |obj|
        obj.save
      end

      before_update = lambda do |obj|
        self.class.uploaded.each do |field, options|
          val = obj.send(field)
          tmp_dir = Rails.root.to_s + '/public' + TMP_DIR
          tmp_file = tmp_dir + '/' + val
          target_dir = Rails.root.to_s + '/public' + Pathname(UPLOAD_DIR + '/' + generate_subdir_path(options[:directory])).cleanpath.to_s
          FileUtils.mkdir_p(target_dir)
          if File.exists?(tmp_file)
            File.rename(tmp_file, target_dir + '/' + val)
            Dir.glob(tmp_dir + '/*').each do |path|
              File.unlink(path)
            end
          end          
        end
      end
            
      define_method :acts_as_uploaded do |field, options = {}|
        options = DEFAULT.clone.merge(options)
        unless @uploaded
          #set_callback(:validate, :before, before_save)
          set_callback(:update, :after, before_update)
          set_callback(:create, :after, after_create)
          validates(field, :format => /^[^\/]+$/)
          @uploaded = {}
        else
          ## 既に定義済みの場合はエラー
          if @uploaded.key?(field)
            raise "Setting for field #{field} in #{self} already exists!" and return
          end
        end
        define_method(field.to_s + '_url') do
          if send(field)
            Pathname(UPLOAD_DIR + '/' + generate_subdir_path(options[:directory])).cleanpath.to_s + '/' + send(field)
          else
            nil
          end            
        end
        @uploaded[field] = options          
      end
    end
  end

  class ActiveRecord::Base
    include ActsAsUploaded
  end
end
