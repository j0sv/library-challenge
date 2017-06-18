require './lib/library.rb'

describe Library do

  it 'has a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'can reed books from a file and save them to an Array of books' do
    expect(subject.books).not_to be nil
  end

  it 'list all available books' do
    expect(subject.filter_books("available")).to be_an_instance_of Array
  end

  it 'reed a file and return an array with books' do
    expect(subject.get_books).to be_an_instance_of Array
  end

  it 'list all books' do
    subject.list_books
  end

  it 'a book can be checked out' do
    #subject.books[1][:available] = true
    tmp_book = subject.books.detect { |obj| obj[:item][:bookid]==1 }
    subject.check_out_book(1)
    expect(tmp_book[:available]).to eq false
  end

  xit 'user can check out a book'
  xit 'user can list all books that user has check ut'
  xit 'librarian can add a new book'

end
