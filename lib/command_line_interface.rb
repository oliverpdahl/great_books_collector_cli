require 'nokogiri'
# require 'colorize'

class CommandLineInterface
  FICTION_PAGE_1_PATH = "https://www.thegreatestbooks.org/"
  FICTION_PAGE_2_PATH = "https://www.thegreatestbooks.org/?page=2"
  FICTION_PAGE_3_PATH = "https://www.thegreatestbooks.org/?page=3"
  FICTION_PAGE_4_PATH = "https://www.thegreatestbooks.org/?page=4"
  FICTION_PAGE_5_PATH = "https://www.thegreatestbooks.org/?page=5"

  def run
    make_books
    # add_amazon_to_books
    display_books
  end

  def make_books
    # page_1_book_array = Scraper.scrape_list_page(FICTION_PAGE_1_PATH + 'index.html')
    # Book.create_from_list(page_1_book_array)
    book_array = [{name: "In Search of Lost Time", author: "Marcel Proust", rank: 1, amazon_url: "https://www.amazon.com/Swanns-Way-Search-Penguin-Classics/dp/0142437964?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0142437964"},
      {name: "Ulysses", author: "James Joyce", rank: 2, amazon_url: "https://www.amazon.com/Ulysses-Wordsworth-Classics-James-Joyce/dp/1840226358?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=1840226358"},
      {name: "Don Quixote", author: "Miguel de Cervantes", rank: 3, amazon_url: "https://www.amazon.com/Don-Quixote-Miguel-Cervantes/dp/0060934344?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0060934344"},
      {name: "The Great Gatsby", author: "F. Scott Fitzgerald", rank: 4, amazon_url: "https://www.amazon.com/Great-Gatsby-F-Scott-Fitzgerald/dp/0743273567?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0743273567"},
      {name: "One Hundred Years of Solitude", author: "Gabriel Garcia Marquez", rank: 5, amazon_url: "https://www.amazon.com/Hundred-Solitude-Harper-Perennial-Classics/dp/0060883286?SubscriptionId=1RN7ZZ7D7SDQHR7TRJG2&tag=shanesherman-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=0060883286"}
      ]
    Book.create_from_list(book_array)
  end

  def display_books
    Book.all.each do |book|
      puts "#{book.name.upcase}"
      puts "  author:" + " #{book.author}"
      puts "  rank:" + " #{book.rank}"
    end
  end
end
