require 'spec_helper'

describe Book do

  #validating presence of book information
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:cover_thumbnail) }
  it { should respond_to(:cover_image) }
  it { should respond_to(:publisher) }
  it { should respond_to(:publish_date) }
  it { should respond_to(:description) }

  it "has a valid factory" do
    book = create(:book).should be_valid
  end

  it "is invalid without a title" do
    build(:book, title: nil).should_not be_valid
  end

  it "returns a user's title as a string" do
    book = create(:book, title: "the Great Gatsby")
    book.title.should == "the Great Gatsby"
  end

  context "missing email and password" do
    it "should not be valid" do
      user = User.new(name: "Rachel")
      # Equivalent to: refute user.valid?
      user.should_not be_valid
    end
  end

  context "missing password" do
    it "should be valid" do
      user = User.new(name: "Rachel", email: "rachel@apple.com")
      # Equivalent to: assert user.valid?
      user.should_not be_valid
    end
  end

  context "with an email & password" do
    it "should be valid" do
      user = User.create(name: "Rachel", email: "rachel@apple.com", password: "password1")
      user.should be_valid
    end
  end

  context "with a email, password & name after delete" do
    it "should be hidden" do
      user = User.create(name: "Rachel", user: user)
      user.destroy
      user.reload
      user.hidden.should be_true
    end
  end

  context "after delete" do
    it "should not display" do
      user = User.create(name: "Rachel", user: user)
      user.destroy
      user.all.count.should == 0
    end
  end

  end
end