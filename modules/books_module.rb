require './book'
require 'json'

class BooksModule
  attr_reader :file_location, :books

  def initialize
    @file_location = 'storage/books.json'
    file = File.open(@file_location)
    @books = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)

    # store book
    book = book.to_json
    @books.push(book)

    # store to file
    file = File.open(@file_location, 'w')
    file.write(JSON[@books])
    file.close
    puts 'Book created successfully'
  end

  # list all books
  def list_all_books
    if @books.empty?
      puts 'Sorry, the books list is currently empty'
    else
      @books.each do |book|
        puts "Tilte: \"#{book['title']}\", Author: #{book['author']}"
      end
    end
  end
end
