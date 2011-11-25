require 'test_helper'

class ActsAsUploadedWithoutAnyOptionTest < ActiveSupport::TestCase
  NoOptionEntry.acts_as_uploaded :image

  test "should add directory path when find" do
    NoOptionEntry.new(:image => 'test.jpg').save
    entry = NoOptionEntry.where(:image => 'test.jpg')
    assert_equal("#{Putit::UPLOAD_DIR}/test.jpg", entry.first.image_url)
  end
end
