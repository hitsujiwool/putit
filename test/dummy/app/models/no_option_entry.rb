class NoOptionEntry < ActiveRecord::Base
  NoOptionEntry.acts_as_uploaded :image
  validates :image, :presence => true
end
