class ValidateOptionEntry < ActiveRecord::Base
  NoOptionEntry.acts_as_uploaded :image
end
