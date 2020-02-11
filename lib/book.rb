class Book
  attr_accessor :name, :author, :rank, :amazon_url, :price, :rating, :ratings_count

  @@all = []

  def self.create_from_list(book_list_array)
    book_list_array.each {|book_hash| self.new(book_hash)}
  end

  def initialize(list_info_hash)
    add_attributes_from_hash(list_info_hash)
    self.class.all << self
  end

  def add_amazon_attributes(amazon_attribute_hash)
    add_attributes_from_hash(amazon_attribute_hash)
  end

  def add_attributes_from_hash(hash)
    hash.each do |key, value|
      self.send("#{key}=", value) if value
    end
  end

  def self.all
    @@all
  end

  def self.delete_all
    @@all.clear
  end

  def self.find_by_rank(rank)
    self.all.find {|book| book.rank == rank}
  end

end
