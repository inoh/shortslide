# coding: utf-8
require 'spec_helper'

describe Image do
  before do
    @image = Image.new
  end

  it "バリデーションが失敗すること" do
    @image.should_not be_valid
  end

  it "fileが選択されていること" do
    @image.should have(1).errors_on(:file)
  end

  context "as_json" do
    it "urlがあること" do
    end
  end
end
