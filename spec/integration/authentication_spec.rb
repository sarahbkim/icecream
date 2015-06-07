require 'rails_helper'
require 'spec_helper'

feature 'Authentication', js: true do
  feature 'login' do
    scenario 'with valid inputs' do
      print :user, :confirmed_user
      @user = FactoryGirl.create(:confirmed_user)
      visit '#/login'
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('button', text: 'Sign in').click
      expect(page).to have_content('Sign out')
    end

    scenario 'redirect after login' do
      @user = FactoryGirl.create(:confirmed_user)
      visit '#/login'
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      find('button', text: 'Sign in').click

      expect(page).to have_content('This is the home page.')
    end
  end  
end