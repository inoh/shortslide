require 'spec_helper'

describe Section do
  before do
    @section = Section.new
  end

  it "template_idが入力されていること" do
    @section.should have(1).errors_on(:template_id)
  end

  it "slide_idが入力されていること" do
    @section.should have(1).errors_on(:slide_id)
  end

  it "paramsが入力されていること" do
    @section.should have(1).errors_on(:params)
  end

  it "スライドが作成されること"

  it "セッションが作成されること"

  it "セッションが削除されること"
end
