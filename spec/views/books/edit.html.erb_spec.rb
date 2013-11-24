require 'spec_helper'

describe 'books/edit.html.erb' do
  let!(:book) { Book.create(title: "L'etranger") }

  before :each do
    assign(:book, book)
    render
  end

  it 'has edit form' do
    expect(rendered).to have_selector("form#edit_book_#{book.id}")
  end
  it 'has book_title field' do
    expect(rendered). to have_selector('#book_title')
  end
  it 'has submit button' do
    expect(rendered). to have_button('Submit')
  end
end
