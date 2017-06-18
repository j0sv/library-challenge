require './lib/library.rb'
require './lib/user.rb'

describe User do

  it 'has a userid on initialize' do
    expect(subject.userid).not_to be nil
  end

  it 'reed a file and return an array with books that the user has borrowed' do
    expect(subject.get_books).to be_an_instance_of Array
  end

end
