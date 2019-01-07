class Book
  attr_accessor :author, :page_count, :genre
  attr_reader :title

  GENRES = []

  def initialize(title)
    @title = title
  end

  def turn_page
    puts "Flipping the page...wow, you read fast!"
  end

end
```

This next error, after running the specs again, though, is kind of weird:

```bash
Failures:

  1) Book GENRES keeps track of all genres
     Failure/Error: expect(Book::GENRES).to include(genre)
       expected [] to include "Thriller"
     # ./spec/01_book_spec.rb:11:in `block (4 levels) in <top (required)>'
     # ./spec/01_book_spec.rb:10:in `each'
     # ./spec/01_book_spec.rb:10:in `block (3 levels) in <top (required)>'
```

We really have no clue how in the world our array would magically contain "Thriller", so let's look at the specific test to figure out what's going on. Here's what we have in `spec/01_book_spec.rb`:

```ruby
describe 'GENRES' do
  it 'keeps track of all genres' do
    genres = ["Thriller", "Science Fiction", "Romance"]
    genres.each_with_index do |genre, i|
      book = Book.new("Book_#{i}")
      book.genre = genre
    end

    genres.each do |genre|
      expect(Book::GENRES).to include(genre)
    end
  end
end
