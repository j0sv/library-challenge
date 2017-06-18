require './lib/library.rb'
require './lib/user.rb'

describe Library do
before { subject.logon_user }

  it 'has a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'read a file and return an array with books' do
    expect(subject.get_books).to be_an_instance_of Array
  end

  it 'books arry is saved in var books' do
    expect(subject.books).not_to be nil
  end

  it 'get all available books' do
    expect(subject.filter_books("available")).to be_an_instance_of Array
  end

  it 'list all available books' do
    subject.list_books('available')
  end

  it 'list all unavailable books' do
    subject.list_books('unavailable')
  end

  it 'a user can logon' do
    expect(subject.logon_user).to be_an_instance_of User
  end

  it 'a book can be checked out' do
    tmp_book = subject.books.detect { |obj| obj[:item][:bookid]==1 }
    subject.check_out_book(tmp_book[:item][:bookid])
    expect(tmp_book[:available]).to eq false
  end

end
