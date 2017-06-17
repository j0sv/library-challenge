require './lib/library.rb'

describe Library do

  it 'has a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'get_books returns a Array with books' do
    expect(subject.get_books).to be_an_instance_of Array
  end

end
