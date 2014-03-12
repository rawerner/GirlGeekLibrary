require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Girl Geek Library'" do
      visit root_path
      expect(page).to have_content('Girl Geek Library')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Girl Geek Library")
    end

    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  describe "How it works page" do

    it "should have the content 'How it works'" do
      visit howitworks_path
      expect(page).to have_content('How it works')
    end

    it "should have the title 'How it works'" do
      visit howitworks_path
      expect(page).to have_title("Girl Geek Library | How it works")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("Girl Geek Library | About Us")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Girl Geek Library | Contact")
    end
  end
end