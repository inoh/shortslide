# coding: utf-8
require 'spec_helper'

describe Slide do
  fixtures :slides, :pages

  before do
    @slide = Slide.new
  end

  it "バリデーションが失敗すること" do
    @slide.should_not be_valid
  end

  it "タイトルが入力されていること" do
    @slide.should have(1).errors_on(:title)
  end

  it "スライドが作成されること" do
    lambda {
      Slide.create!(title: "テストタイトル")
    }.should change(Slide, :count).by(1)
  end

  it "ページ一覧が取得出来ること" do
    slides(:success).pages.should == [pages(:success)]
  end
end
