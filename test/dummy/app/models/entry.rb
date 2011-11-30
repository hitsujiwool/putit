class Entry < ActiveRecord::Base
  acts_as_uploaded :image
  acts_as_uploaded :thumbnail
end
