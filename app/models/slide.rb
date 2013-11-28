# coding: utf-8
class Slide < ActiveRecord::Base
  validates :title, :presence => true

  def pages
    ret = []
    if content
      content.each_line do |line|
        if line =~ /^## /
          ret << Page.new(id: ret.length + 1, content: line)
        else
          ret.last.content += line if ret.last
        end
      end
    end
    ret
  end
end
