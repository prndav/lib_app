require 'spec_helper'

describe Reader do
  let(:reader) { Reader.new }

  describe 'validations' do
    before :each do
      @params = {
        email: 'email@email.com',
        password: 'pass',
        password_confirmation: 'pass'
      }
    end

    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    # it 'is invalid when email is empty' do
    #   @params[:email] = nil
    #   reader = Reader.new(@params)
    #   expect(reader.valid?).to be_false
    # end
    # it 'is invalid when password in empty' do
    #   @params[:password] = nil
    #   reader = Reader.new(@params)
    #   expect(reader.valid?).to be_false
    # end
    it 'is invalid when email is invalid' do
      @params[:email] = 'porna'
      reader = Reader.new(@params)
      expect(reader.valid?).to be_false
    end
    # it 'is invalid when email is not uniq' do
    #   Reader.create(@params)
    #   reader = Reader.new(@params)
    #   expect(reader.valid?).to be_false
    # end
    # it 'is invalid when password and password_confirmation are not the same' do
    #   @params[:password] = 'p'
    #   reader = Reader.new(@params)
    #   expect(reader.valid?).to be_false
    # end
  end
  it 'is an ActiveRecord model' do
    expect(Reader.superclass).to eq(ActiveRecord::Base)
  end
  it 'has email' do
    reader.email = 'email@email.com'
    expect(reader.email).to eq('email@email.com')
  end
  it 'responds to password' do
    reader.password = 'albaverde'
    expect(reader.password).to eq('albaverde')
  end
  it 'responds to password_confirmation' do
    reader.password_confirmation = 'albaverde'
    expect(reader.password_confirmation).to eq('albaverde')
  end
end
