require 'spec_helper'

describe 'books/index.html.erb' do
  let!(:book) { Book.create(title: 'Dr.Bloodmoney') }
  before :each do
    assign(:books, Book.all)
    render
  end
  it 'has section with all books' do
    expect(rendered).to have_selector('div#books_list')
  end

  it 'shows books titles' do
    expect(rendered).to have_content(book.title)
  end
end
