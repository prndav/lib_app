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
  # visit books_url
  # expect(page).to have_content('The scanner darkly')
end
