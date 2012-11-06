require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "show profile page" do
    # Code to make a user variable
    let(:user) { FactoryGirl.create(:user) }
    before do 
      visit user_path(user) 
      puts user.name
    end

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

end