require 'spec_helper'

describe Page do
  fixtures :slides, :templates, :pages

  before do
    @page = Page.new
  end

  it "バリデーションが失敗すること" do
    @page.should_not be_valid
  end

  it "スライドIDが入力されていること" do
    @page.should have(1).errors_on(:slide_id)
  end

  it "ページ内容が入力されていること" do
    @page.should have(1).errors_on(:content)
  end

  it "ページが作成されること" do
    lambda {
      Page.create!(slide_id: slides(:success).id, content: "追加内容")
    }.should change(Page, :count).by(1)
  end

end
