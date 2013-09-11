require 'spec_helper'

describe Section do
  fixtures :slides, :sections, :templates

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

  it "セッションが作成されること" do
    lambda {
      Section.create!(template_id: templates(:success).id, slide_id: slides(:success).id, params: "{test: 'test'}")
    }.should change(Section, :count).by(1)
  end
end
