# coding: utf-8
class Page < ActiveRecord::Base
  validates :slide_id, :content, :presence => true
end
