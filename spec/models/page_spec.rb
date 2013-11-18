require 'spec_helper'

describe Page do
  fixtures :slides, :templates, :pages

  describe "基本チェック" do
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
  end

  describe "基本更新" do
    it "ページが作成されること" do
      lambda {
        Page.create!(slide_id: slides(:success).id, content: "追加内容")
      }.should change(Page, :count).by(1)
    end

    it "ページが削除されること" do
      lambda {
        Page.first.destroy!
      }.should change(Page, :count).by(-1)
    end
  end

  describe "HTML編集" do
    before do
      @page = Page.new(content: 'test')
    end

    it "content" do
      @page.content.should == 'test'
    end

    it "正常に変換される" do
      Page.new(content: 'test').html.should == "<p>test</p>\n"
    end
  end

end
