require 'spec_helper'

describe Reader do
  let(:reader) { Reader.new }
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
