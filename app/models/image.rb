class Image < ApplicationRecord
  validates :url, url: true
  acts_as_taggable
end
