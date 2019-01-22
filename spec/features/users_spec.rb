require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    before(:each) do
      visit new_user_path
      within('form') do
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Doe'
      end
    end
    scenario 'should be successful' do
          within('form') do
            fill_in 'Email', with: 'JD@hotmail.com'
            fill_in 'Password', with: '123'
          end
      click_button 'Sign Up!'
    end

    scenario 'should fail' do
      click_button 'Sign Up!'
    end
  end
end
