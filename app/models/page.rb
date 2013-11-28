class Page
  include ActiveModel::Model
  attr_accessor :id, :content

  def html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(content)
  end
end
