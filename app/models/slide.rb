class Slide < ActiveRecord::Base
  has_many :section, :dependent => :destroy

  validates :title, :presence => true
end
