require "spec_helper"

describe "Book" do

  let!(:book_array) {[{name: "In Search of Lost Time", author: "Marcel Proust", rank: 1},
    {name: "Ulysses", author: "James Joyce", rank: 2},
    {name: "Don Quixote", author: "Miguel de Cervantes", rank: 3},
    {name: "The Great Gatsby", author: "F. Scott Fitzgerald", rank: 4},
    {name: "One Hundred Years of Solitude", author: "Gabriel Garcia Marquez", rank: 5}
    ]}

  let!(:book) {Book.new({name: "In Search of Lost Time", author: "Marcel Proust", rank: 1})}

  let!(:book_amazon_hash) {{price: 11.93, rating: 4.0, ratings_count: 602, pages: 468}}

  describe '.all' do
    it 'returns the class variable @@all' do
      Student.class_variable_set(:@@all, [])
      expect(Student.all).to match_array([])
    end
  end

  describe '#new' do
    it 'correctly adds the information about the book' do
      attribute_hash = {name: "In Search of Lost Time", author: "Marcel Proust", rank: 1}
      expect{Book.new(attribute_hash)}.to_not raise_error
      expect(book.name).to eq("In Search of Lost Time")
      expect(book.author).to eq("Marcel Proust")
      expect(book.rank).to eq(1)
    end

    it "adds the book to the collection in books" do
      expect(Book.class_variable_get(:@@all).first.name).to eq("In Search of Lost Time")
    end

  end

  describe ".create_from_list" do
    it "uses the book list to create a bunch of books" do
      Book.class_variable_set(:@@all, [])
      Book.create_from_list(book_array)
      expect(Book.class_variable_get(:all).first.name).to eq("In Search of Lost Time")
    end
  end

  describe "#add_amazon_attributes" do
    it "adds the attributes with an amazon hash" do
      book.add_amazon_attributes(book_amazon_hash)
      expect(book.price). to eq(11.93)
      expect(book.rating). to eq(4.0)
      expect(book.ratings_count). to eq(602)
      expect(book.pages). to eq(468)
    end
  end


end
