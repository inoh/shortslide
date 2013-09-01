require 'spec_helper'

describe Slide do
  before do
    @slide = Slide.new
  end

  it "バリデーションが失敗すること" do
    @slide.should_not be_valid
  end

  it "titleが入力されていること" do
    @slide.should have(1).errors_on(:title)
  end

  it "スライドが作成されること" do
    lambda {
      Slide.create!(title: "テストタイトル")
    }.should change(Slide, :count).by(1)
  end

  it "スライドが削除されること"

  it "セッションが削除されること"
end
