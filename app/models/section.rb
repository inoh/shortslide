class Section < ActiveRecord::Base
  validates :template_id, :presence => true
  validates :slide_id, :presence => true
  validates :params, :presence => true
end
