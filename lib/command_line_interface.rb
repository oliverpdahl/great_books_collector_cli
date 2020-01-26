class CommandLineInterface
  FICTION_PAGE_1_PATH = "https://www.thegreatestbooks.org/"
  FICTION_PAGE_2_PATH = "https://www.thegreatestbooks.org/?page=2"
  FICTION_PAGE_3_PATH = "https://www.thegreatestbooks.org/?page=3"
  FICTION_PAGE_4_PATH = "https://www.thegreatestbooks.org/?page=4"
  FICTION_PAGE_5_PATH = "https://www.thegreatestbooks.org/?page=5"

  PAGE_LINKS = [FICTION_PAGE_1_PATH,
    FICTION_PAGE_2_PATH,
    FICTION_PAGE_3_PATH,
    FICTION_PAGE_4_PATH,
    FICTION_PAGE_5_PATH
  ]

  def run
    make_books
    display_books
    ask_for_book
  end

  def make_books
    PAGE_LINKS.each do |link|
      book_array = Scraper.scrape_list_page(link)
      Book.create_from_list(book_array)
    end
  end

  def display_books
    Book.all.each do |book|
      puts "#{book.name.upcase}"
      puts "  author:" + " #{book.author}"
      puts "  rank:" + " #{book.rank}"
    end
  end

  def display_book(book)
    puts "#{book.name.upcase}"
    puts "  author:" + " #{book.author}"
    puts "  rank:" + " #{book.rank}"
  end

  def ask_for_book
    puts "Are there any books you would like to know the amazon information on?"
    puts "Please input the rank, list again, or exit"
    input = gets.strip
    case input
    when "list again"
      display_books
      ask_for_book
    when "exit"
      goodbye
    else
      input_i = input.to_i
      if input_i > 0
        display_amazon_information(input_i)
      else
        puts "Please input a valid rank, list again, or exit"
      end
    end
  end

  def display_amazon_information(rank)
    book = Book.find_by_rank(rank)
    amazon_hash = Scraper.scrape_amazon_page(book.amazon_url)
    book.add_amazon_attributes(amazon_hash)
    display_book(book)
    puts "  price:" + " $#{book.price}"
    puts "  number of ratings:" + " #{book.ratings_count} ratings"
    puts "  rating:" + " #{book.rating} out of 5 stars"
    ask_for_book
  end

  def goodbye
    puts "Thanks for using Great Books Collector"
  end

end
