class PutitController < ApplicationController
  def show
    render 'putit/show'
  end
  
  def upload
    file = params[:file]
    filename = '__' + DateTime.now.to_i.to_s + '__' + file.original_filename
    tmp_dir_abspath = Rails.root.to_s + '/public' + Putit::TMP_DIR
    FileUtils.mkdir_p(tmp_dir_abspath)
    tmp_file_abspath = tmp_dir_abspath + '/' + filename
    File.open(tmp_file_abspath, 'wb') do |f|
      f.write(file.read)
      render :json => { :status => 'OK', :body => { :tmp_filepath => root_url.gsub(/\/$/, '') + Putit::TMP_DIR + '/' + filename, :filename => filename } }
    end
  rescue
    render :json => { :status => 'ERROR' }, :status => 500
  end
end
