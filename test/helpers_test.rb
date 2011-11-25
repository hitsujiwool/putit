require 'test_helper'

class HelpersTest < ActiveSupport::TestCase
  test "should generate root relative path" do
    assert_equal('/uploads/foo/bar/image.jpg', Putit::Helpers.add_dir_path('/foo/bar/', 'image.jpg'))
  end

  test "should complete {/}subdir_path{/} and generate root relative path" do
    assert_equal('/uploads/foo/bar/image.jpg', Putit::Helpers.add_dir_path('foo/bar', 'image.jpg'))
  end

  test "should complete /subdir_path{/} and generate root relative path" do
    assert_equal('/uploads/foo/bar/image.jpg', Putit::Helpers.add_dir_path('/foo/bar', 'image.jpg'))
  end

  test "should complete {/}subdir_path and generate root relative path" do
    assert_equal('/uploads/foo/bar/image.jpg', Putit::Helpers.add_dir_path('foo/bar/', 'image.jpg'))
  end

  test "should strip direrctory path" do
    assert_equal('image.jpg', Putit::Helpers.extract_filename('/foo/bar/image.jpg'))
  end
end
