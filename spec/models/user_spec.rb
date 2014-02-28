require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com", location: "Nashville, TN", bio: "I am a student at the Nashville Software School") }

  subject { @user }

#validating presence of information
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:location) }

  it { should be_valid }

# validating name
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

#validating email
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@email,com a_user_name.com, user.name@domain.name@domain_name.com user@domian+name.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@domain.COM a_US-ER@f.b.org frst.lst@domain.jp frst+lst@domain.us]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end


end






