class Slide < ActiveRecord::Base
  has_many :pages, :dependent => :destroy

  validates :title, :presence => true
end
