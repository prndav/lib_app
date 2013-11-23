require 'spec_helper'

describe BooksController do
  describe 'GET index' do
    it 'assigns all books to @books variable' do
      Book.stub(:all).and_return(true)
      get :index
      expect(assigns[:books]).to eq(Book.all)
    end
    it 'renders index template'
  end
  describe 'GET new' do
    let!(:book) { mock_model('Book') }

    before :each do
      Book.stub(:new).and_return(book)
      get :new
    end

    it 'assigns @book variable to the view' do
      expect(assigns[:book]).to eq(book)
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    let!(:book) { stub_model(Book) }
    let(:params) do
      {
        'title' => 'Slaughterhouse five',
        'author' => 'Kurt Vonnegut',
        'pages' => '200',
        'description' => 'About war'
      }
    end

    before :each do
      Book.stub(:new).and_return(book)
    end

    it 'sends new message to Book class' do
      book.stub(:save).and_return(true)
      Book.should_receive(:new).with(params).and_return(book)
      post :create, book: params
    end

    it 'sends save message to book model' do
      book.should_receive(:save)
      post :create, book: params
    end

    context 'when save message returns true' do
      before :each do
        book.stub(:save).and_return(true)
        post :create, book: params
      end

      it 'redirects to book' do
        expect(response).to redirect_to books_url
      end
      it 'assigns flash message' do
        expect(flash[:success]).not_to be_nil
      end
    end

    context 'when save message returns false' do
      before :each do
        book.stub(:save).and_return(false)
        post :create, book: params
      end

      it 'renders new template' do
        expect(response).to render_template(:new)
      end
      it 'sets flash message' do
        expect(flash[:notice]).not_to be_nil
      end
      it 'assings book to @book' do
        expect(assigns(:book)).to eq(book)
      end
    end
  end

  describe 'GET show' do
    let!(:book) { Book.create(title: 'Cats craddle') }

    it 'sends find message to book class' do
      Book.should_receive(:find)
      get :show, id: book.id
    end
    it 'assings book to @book variable' do
      get :show, id: book.id
      expect(assigns[:book]).to eq(book)
    end
  end
end
