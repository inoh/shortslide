class Page
  include ActiveModel::Model
  attr_accessor :id

  def content
    @content ||= []
  end

  def content=(content)
    @content = content
  end

  def html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(content.join("\n"))
  end

  def class_names
    [content.length == 1 ? "shout" : ""]
  end
end
