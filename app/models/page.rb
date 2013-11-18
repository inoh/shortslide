# coding: utf-8
class Page < ActiveRecord::Base
  validates :slide_id, :content, :presence => true

  def html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(content)
  end
end
