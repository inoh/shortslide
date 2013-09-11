# coding: utf-8
require 'spec_helper'

describe Template do
  fixtures :templates

  describe "空オブジェクトの確認" do
    before do
      @template = Template.new
    end

    it "バリデーションが失敗すること" do
      @template.should_not be_valid
    end

    it "名前が入力されていること" do
      @template.should have(1).errors_on(:name)
    end

    it "コンテンツが入力されていること" do
      @template.should have(1).errors_on(:content)
    end
  end

  describe "基本更新の確認" do
    it "テンプレートが作成されること" do
      lambda {
        Template.create(name: "テストテンプレート", content: "<p>{{ content }}</p>")
      }.should change(Template, :count).by(1)
    end

    it "テンプレートが削除されること" do
      lambda {
        templates(:success).destroy
      }.should change(Template, :count).by(-1)
    end
  end

  describe "パラメタの確認" do
    before do
      @template = templates(:success)
    end

    it "属性一覧が取得出来ること" do
      @template.params.length.should == 2
    end

    it "属性一覧が正しいこと" do
      @template.params.should =~ ['title', 'body']
    end

    it "セクションが作成出来ること" do
      pending "javascript側でやるので必要ないかも"
      result = "<h2>rspec</h2><p>test</p>"
      @template.create_section(title: "rspec", body: "test").should == result
    end
  end

end
