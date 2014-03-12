require 'spec_helper'


describe User do

  it "has a valid factory" do
    user = create(:user).should be_valid
  end

  it "is invalid without a email" do
    build(:user, email: nil).should_not be_valid
  end

  it "returns a user's email as a string" do
    user = create(:user, email: "rachel@hotmail.com")
    user.email.should == "rachel@hotmail.com"
  end

end
