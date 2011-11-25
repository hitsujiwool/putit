module Putit
  module Helpers 
    def self.extract_filename(val)
      val ? val.rpartition('/').last : nil
    end

    def self.add_dir_path(subdir_path, val)
      (UPLOAD_DIR + '/' + subdir_path + '/' + val).squeeze('/')
    end
  end
end
