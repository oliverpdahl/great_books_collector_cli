class Scaper

  def self.scrape_list_page(list_url)
    doc = Nokogiri::HTML(open(list_url))
    book_cards = doc.css()#code to get to cards)
    book_cards.collect do |book|
      book_hash = {}
      book_hash[:name] = book.css("").text #gets the name element
      book_hash[:author] = book.css("").text #gets the location element
      book_hash[:rank] = book.css("").text.to_i
      book_hash[:amazon_url] = student.css("a").attribute("href").value #gets tt
      book_hash
    end
  end

  def self.scrape_amazon_page(amazon_url)
    doc = Nokogiri::HTML(open(profile_url))
    amazon_attribute_hash = {}
    #scrape code
    amazon_attribute_hash
  end

end
