# coding: utf-8
class Slide < ActiveRecord::Base
  validates :title, :presence => true

  def pages
    ret = []
    if content
      content.each_line do |line|
        ret << Page.new(id: ret.length + 1) if line =~ /^## /
        ret.last.content << line.chomp unless line.chomp.empty?
      end
    end
    ret
  end
end
