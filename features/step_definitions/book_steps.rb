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
  visit book_path(hamlet)
end

Then(/^I should see "(.*?)" book details$/) do |book|
  expect(page).to have_content(book)
end

Then(/^I should see "(.*?)" book edit link$/) do |book|
  expect(page).to have_link('edit')
end

When(/^I go to nonexistent book page$/) do
  visit book_path(1000)
end

Then(/^I should be redirected to library page$/) do
  expect(current_path).to eq('/books')
end

Then(/^I should see "(.*?)" error message$/) do |message|
  expect(page).to have_content(message)
end

When(/^I change book title to "(.*?)"$/) do |new_title|
  hamlet = Book.find_by_title('The Hamlet')
  visit book_path(hamlet)
  click_link('edit')
  fill_in 'book_title', with: new_title
  click_button 'Submit'
end

Then(/^book "(.*?)" should not exist in database$/) do |title|
  expect(Book.find_by_title(title)).to be_nil
end

Then(/^book "(.*?)" should exist in database$/) do |title|
  expect(Book.find_by_title(title)).not_to be_nil
end

Then(/^I should see "(.*?)" book on library page$/) do |title|
  visit books_url
  expect(page).to have_content(title)
end

When(/^I delete it$/) do
  book = Book.find_by_title("The Hamlet")
  visit book_path(book)
  click_link('delete')
end

Then(/^I should not see "(.*?)" book on library page$/) do |title|
  visit books_url
  expect(page).not_to have_content(title)
end


Given(/^I am 'reader(\d+)@email\.com' reader$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^reader with "(.*?)" exists$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end



