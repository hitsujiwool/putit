class IndexController < ApplicationController
  def index
    entry = NoOptionEntry.new(:image => "#{Putit::UPLOAD_DIR}/test.jpg")
    entry.save
    @entry = NoOptionEntry.first    
  end
  
  def update
    redirect_to root_url
  end

end
