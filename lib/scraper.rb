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
      #need to deal with other numbers coming too
      book_hash[:rank] = /(?<=(\s))\d+(?=(\n\.))/.match(header_text).to_s.to_i
      amazon_url = book.css("div.pb-3 div.pull-left.mr-3 div a").attribute("href")
      book_hash[:amazon_url] = amazon_url.value if amazon_url
      book_hash
    end
  end

  def self.scrape_amazon_page(amazon_url)
    api = ProxyCrawl::API.new(token: 'nmDKKOm5xqzUxiSD6j6_8g')
    html = api.get(amazon_url)

    doc = Nokogiri::HTML(html.body)

    amazon_hash = {}
    amazon_hash[:price] = doc.css('div#rbbContainer div#buyNewSection span.a-size-medium.a-color-price.offer-price.a-text-normal').text.match(/(?<=\$).*/).to_s.to_f
    amazon_hash[:ratings_count] = doc.css('span#acrCustomerReviewText').text.match(/.*(?=\sratings)/).to_s.delete(',').to_i
    amazon_hash[:rating] = doc.css('span#acrPopover').text.match(/\d\.*\d*(?=\sout)/).to_s.to_f

    amazon_hash
  end

end
