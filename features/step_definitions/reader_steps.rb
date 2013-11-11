Given(/^I am a quest$/) do

end

When(/^I fill the register form with valid data$/) do
  visit('/register')
  fill_in 'reader_email', with: 'porna@mail.com'
  fill_in 'reader_password', with: 'albaverde'
  fill_in 'reader_password_confirmation', with: 'albaverde'
  click_button 'Register'
end
