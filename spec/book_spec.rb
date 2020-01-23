require "spec_helper"

describe "Book" do

  let!(:book_array) {[{name: "In Search of Lost Time", author: "Marcel Proust", rank: 1, amazon_url: "https://www.amazon.com/Swanns-Way-Search-Penguin-Classics/dp/0142437964?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0142437964"},
    {name: "Ulysses", author: "James Joyce", rank: 2, amazon_url: "https://www.amazon.com/Ulysses-Wordsworth-Classics-James-Joyce/dp/1840226358?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=1840226358"},
    {name: "Don Quixote", author: "Miguel de Cervantes", rank: 3, amazon_url: "https://www.amazon.com/Don-Quixote-Miguel-Cervantes/dp/0060934344?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0060934344"},
    {name: "The Great Gatsby", author: "F. Scott Fitzgerald", rank: 4, amazon_url: "https://www.amazon.com/Great-Gatsby-F-Scott-Fitzgerald/dp/0743273567?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0743273567"},
    {name: "One Hundred Years of Solitude", author: "Gabriel Garcia Marquez", rank: 5, amazon_url: "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0060883286"}
    ]}

  let!(:book) {Book.new({name: "In Search of Lost Time", author: "Marcel Proust", rank: 1})}

  let!(:book_amazon_hash) {{price: 11.93, rating: 4.0, ratings_count: 602, page_count: 468}}

  describe '.all' do
    it 'returns the class variable @@all' do
      Book.class_variable_set(:@@all, [])
      expect(Book.all).to match_array([])
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
      expect(Book.all.first.name).to eq("In Search of Lost Time")
    end
  end

  describe "#add_amazon_attributes" do
    it "adds the attributes with an amazon hash" do
      book.add_amazon_attributes(book_amazon_hash)
      expect(book.price). to eq(11.93)
      expect(book.rating). to eq(4.0)
      expect(book.ratings_count). to eq(602)
      expect(book.page_count). to eq(468)
    end
  end


end
