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



  xit 'can get a subset of all boks than have the critera available'
  xit 'can search and get a list of all books meeting search critera'
  xit 'user can check out a book'
  xit 'user can list all books that user has check ut'
  xit 'librarian can add a new book'

end
