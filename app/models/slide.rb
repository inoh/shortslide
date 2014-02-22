# coding: utf-8
class Slide < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true

  def pages
    ret = []
    if content
      content.each_line do |line|
        ret << Page.new(id: ret.length + 1) if line =~ /^## /
        unless line.chomp.empty?
          ret << Page.new(id: "nbsp;") unless ret.last
          ret.last.content << line.chomp 
        end
      end
    end
    ret
  end
end
