require 'spec_helper'

describe User do
  describe "基本チェック" do
    before do
      @user = User.new
    end

    it "バリデーションが失敗すること" do
      @user.should_not be_valid
    end
  end
end
