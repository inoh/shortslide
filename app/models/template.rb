# coding: utf-8
class Template < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true

  # テンプレートのパラメタ一覧を返します。
  # _return_ :: Array
  def params
    content.scan(/{{(.*?)}}/).flatten.map{|lang| lang.strip }
  end
end
