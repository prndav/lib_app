require 'spec_helper'

describe Book do
  let!(:book) { Book.new }
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  it { should respond_to(:author) }
  it { should respond_to(:pages) }
  it { should respond_to(:description) }
  # it 'responds to author' do
  #   book.author = 'Philip K.Dick'
  #   expect(book.author).to eq('Philip K.Dick')
  # end
  # it 'responds to pages' do
  #   book.pages = 200
  #   expect(book.pages).to eq(200)
  # end
  # it 'responds to description' do
  #   book.description = 'Sci-fi genre'
  #   expect(book.description).to eq('Sci-fi genre')
  # end
end
