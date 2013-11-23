require 'spec_helper'

describe 'books/new.html.erb' do
  before :each do
    book = mock_model('Book').as_new_record.as_null_object
    assign(:book, book)
    render
  end

  it 'has new book form' do
    expect(rendered).to have_selector('form#new_book')
  end
  it 'has title field' do
    expect(rendered).to have_selector('#book_title')
  end
  it 'has description field' do
    expect(rendered).to have_selector('#book_description')
  end
  it 'has pages field' do
    expect(rendered).to have_selector('#book_pages')
  end
  it 'has author field' do
    expect(rendered).to have_selector('#book_author')
  end
  it 'has submit button' do
    expect(rendered).to have_button('Submit')
  end
end
