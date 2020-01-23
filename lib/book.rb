class Book
  attr_accessor :name, :author, :rank, :amazon_url, :price, :page_count, :rating, :ratings_count

  @@all = []

  def initialize(list_info_hash)
    add_attributes_from_hash(list_info_hash)
    self.class.all << self
  end

  def add_amazon_attributes(amazon_attribute_hash)
    add_attributes_from_hash(amazon_attribute_hash)
  end

  def add_attributes_from_hash(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def all
    @@all
  end

  def delete_all
    @@all.clear
  end

end
