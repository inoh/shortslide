class Slide < ActiveRecord::Base
  validates :title, :presence => true
end
