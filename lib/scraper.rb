class Scaper

  def self.scrape_list_page(list_url)
    doc = Nokogiri::HTML(open(list_url))
    book_list_hash = {}
    #scrape code
    book_list_hash
  end

  def self.scrape_amazon_page(amazon_url)
    doc = Nokogiri::HTML(open(profile_url))
    amazon_attribute_hash = {}
    #scrape code
    amazon_attribute_hash
  end

end
