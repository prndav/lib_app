# Create new book scenario

When(/^I fill the new book form with valid data$/) do
  visit new_book_path
  fill_in 'book_title', with: 'The scanner darkly'
  fill_in 'book_author', with: 'Philip K.Dick'
  fill_in 'book_pages', with: '220'
  fill_in 'book_description', with: 'Sci-fi genre'
  click_button('Submit')
end

Then(/^the book should be added to database$/) do
  expect(Book.find_by_title('The scanner darkly')).not_to be_nil
end

Then(/^I should see it on library page$/) do
  visit books_url
  expect(page).to have_content('The scanner darkly')
end

When(/^I fill the new book form with empty title$/) do
  visit new_book_path
  fill_in 'book_title', with: ''
  fill_in 'book_author', with: 'Philip K.Dick'
  fill_in 'book_pages', with: '220'
  fill_in 'book_description', with: 'Sci-fi genre'
  click_button('Submit')
end

Then(/^the book should not be added to database$/) do
  expect(Book.find_by_title('')).to be_nil
end

Then(/^I should see the new book form with error message$/) do
  expect(page).to have_selector('form#new_book')
  expect(page).to have_selector('.notice')
end

Given(/^book "(.*?)" exists$/) do |book|
  Book.create(title: book)
end

When(/^I go to "(.*?)" book page$/) do |book|
  hamlet = Book.find_by_title(book)
  visit book_path(book)
end

Then(/^I should see "(.*?)" book details$/) do |book|
  expect(page).to have_content(book)
end

Then(/^I should see "(.*?)" book edit link$/) do |book|
  expect(page).to have_link('edit')
end

