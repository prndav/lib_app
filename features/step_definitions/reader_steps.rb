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
  pending # express the regexp above with the code you wish you had
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



