require 'spec_helper'

describe 'books/show.html.erb' do
  let!(:book) { Book.create(title: 'Alba Verde') }
  it 'displays books title' do
    assign(:book, book)
    render
    expect(rendered).to have_content(book.title)
  end

  it 'has edit link' do
    assign(:book, book)
    render
    expect(rendered).to have_link('edit')
  end
end
