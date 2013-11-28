# coding: utf-8
require 'spec_helper'

describe Slide do
  fixtures :slides

  describe "基本チェック" do
    before do
      @slide = Slide.new
    end

    it "バリデーションが失敗すること" do
      @slide.should_not be_valid
    end

    it "タイトルが入力されていること" do
      @slide.should have(1).errors_on(:title)
    end
  end

  describe "基本更新" do
    it "スライドが作成されること" do
      lambda {
        Slide.create!(title: "テストタイトル")
      }.should change(Slide, :count).by(1)
    end

    it "スライドが削除されること" do
      lambda {
        Slide.first.destroy!      
      }.should change(Slide, :count).by(-1)
    end
  end

  describe "関連確認" do
    it "ページ一覧が取得出来ること" do
      slides(:success).pages.count.should == 2
    end
  end

  describe "分析確認" do
    it "タイトルが取得出来ること" do
      slides(:success).title.should == "メインタイトル"
    end
  end
end
