require_relative '../config/environment.rb'
class Scraper

  def self.scrape_list_page(list_url)
    doc = Nokogiri::HTML(open(list_url))
    book_cards = doc.css("ol.list-unstyled li.item.pb-3")#code to get to cards)
    book_cards.collect do |book|
      book_hash = {}
      header = book.css("h4")
      header_text = header.text
      book_hash[:name] = header.css("a").first.text.strip
      book_hash[:author] = header.css("a").last.text.strip
      book_hash[:rank] = /(?<=(\s))\d+(?=(\n\.))/.match(header_text).to_s.to_i
      book_hash[:amazon_url] = book.css("div.pb-3 div.pull-left.mr-3 div a").attribute("href").value
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

Scraper.scrape_list_page("https://www.thegreatestbooks.org/")
