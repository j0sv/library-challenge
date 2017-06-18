require './lib/library.rb'
require './lib/user.rb'

describe User do

  it 'has a userid on initialize' do
    expect(subject.userid).not_to be nil
  end

  it 'reed a file and return an array with books that the user has borrowed' do
    expect(subject.get_books).to be_an_instance_of Array
  end

  it 'a book can be added to the user list of borrowed books' do
    init_size = File.size('./lib/books_user_data.yml')
    expect(subject.add_book(4)).to be > init_size
  end

  it 'a user can list the books the user has borrowed and see return date' do
    expect(subject.list_borrowed_books).to be nil
  end

end
