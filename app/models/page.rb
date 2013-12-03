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
    if content.length == 1
      ["shout"]
    elsif content.length == 2 && content[1] =~ /<img /
      ["cover"]
    else
      []
    end
  end
end
