Given(/^I am a quest$/) do

end

When(/^I fill the register form with valid data$/) do
  visit('/register')
  fill_in 'reader_email', with: 'porna@mail.com'
  fill_in 'reader_password', with: 'albaverde'
  fill_in 'reader_password_confirmation', with: 'albaverde'
  click_button 'Register'
end

Then(/^I should be registered in application$/) do
  expect(Reader.find_by_email('porna@mail.com')).not_to be_nil
end

Then(/^I should be logged in$/) do
  expect(page).to have_content('Welcome, porna@mail.com')
end


When(/^I fill the register form with invalid data$/) do
  visit('/register')
  fill_in 'reader_email', with: 'porna'
  fill_in 'reader_password', with: 'albaverde'
  fill_in 'reader_password_confirmation', with: 'albaverde'
  click_button 'Register'
end

Then(/^I should the register form again$/) do
  expect(page).to have_selector('form#new_reader')
end

Then(/^I should not be registered in application$/) do
  expect(Reader.find_by_email('porna')).to be_nil
end

Given(/^I am a guest$/) do

end

When(/^I go to home page as guest$/) do
  visit root_url
end

Then(/^I should see guest menu$/) do
  expect(page).to have_selector('#top-menu')
  expect(page).to have_link('Register', href: register_path)
end

Given(/^I am a "(.*?)" reader$/) do |email|
  step "reader with \"#{email}\" exists"
  step "I fill the login form with valid data for \"#{email}\" reader"
end

When(/^I go to home page as reader$/) do
  visit root_url
end

Then(/^I should see "(.*?)" reader menu$/) do |email|
  expect(page).to have_content("Welcome, #{email}")
end

Given(/^Reader with "(.*?)" exists$/) do |email|
  Reader.create( email: email, password: 'albaverde', password_confirmation: 'albaverde')
end

When(/^I fill the login form with valid data for "(.*?)" reader$/) do |email|
  visit("/login")
  fill_in 'login_email', with: email
  fill_in 'login_password', with: 'albaverde'
  click_button 'Login'
end

Then(/^I should be logged in as "(.*?)" reader$/) do |email|
  expect(page).to have_content("Welcome, #{email}")
end

When(/^I go to logout page$/) do
  visit('/logout')
end

Then(/^I should be logged out$/) do
  expect(page).not_to have_content('Welcome')
  expect(page).to have_content('Register')
end





