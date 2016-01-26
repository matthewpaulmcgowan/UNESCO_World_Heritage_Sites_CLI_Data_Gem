class UNESCOWorldHeritageSites::CLI
  attr_accessor :input, :chosen_country, :site
  
  def call
    introduction
    call_country
  end
  
  def introduction
    puts "Hello, we are learning about UNESCO World Heritage Sites!"
    puts "UNESCO, began their list of heritage sites in 1978 and now counts over 1100 from over 160 countries."
    puts "The heritage sites are listed by country so please select the id of a country to begin to learn!"
  end
  
  def call_country
    UNESCOWorldHeritageSites::Countries.clear
    UNESCOWorldHeritageSites::Sites.clear
    UNESCOWorldHeritageSites::Scraper.scrape_main_page
    UNESCOWorldHeritageSites::Countries.print_countries
    puts ""
    puts "Please select the id of the country you would like to search about"
    @input=gets.strip
    puts ""
    response_checker(UNESCOWorldHeritageSites::Countries.number_of_countries)
    @chosen_country=UNESCOWorldHeritageSites::Countries.find_country(@input)
    @chosen_country.country_specific_sites
    printing_sites
  end
  
  def printing_sites
    puts "These are the heritage sites of #{@chosen_country.name}."
    UNESCOWorldHeritageSites::Sites.print_all_sites
    puts ""
    puts "Which site would you like to learn more about?"
    @input=gets.strip
    puts ""
    response_checker(UNESCOWorldHeritageSites::Sites.number_of_sites)
    @site=UNESCOWorldHeritageSites::Sites.find_site(@input)
    @site.print_site_data
    puts ""
    puts "Would you like to add this site to your favorites?"
    puts "Please enter 1 for yes or two for no."
    @input=gets.strip
    response_checker(2)
    add_to_favorites
    puts ""
    puts "Enter the number of the option you would like from the list below."
    puts "1: to look at the same country's heritage sites"
    puts "2: to pick a new country"
    puts "3: to print your favorite heritage sites"
    puts "4: to exit"
    @input=gets.strip
    puts ""
    response_checker(4)
    if @input=="1"
      printing_sites
    elsif @input=="2"
      call_country
    elsif @input=="3"
      UNESCOWorldHeritageSites::User_Favorites.print_favorites
      puts ""
      what_is_next_move
    else
      goodbye
      abort
    end
  end
  
  def response_checker(high_limit) 
    if !(@input.to_i>0)||!(@input.to_i<=high_limit)
      puts "Please enter a valid response."
      @input=gets.strip
      puts ""
      response_checker(high_limit)
    end
  end
  
  def add_to_favorites
    if @input=="1"
      UNESCOWorldHeritageSites::User_Favorites.save(@site)
    end
  end
  
  def what_is_next_move   
    puts "Enter the number of the option you would like from the list below."
    puts "1: to look at the same country's heritage sites"
    puts "2: to pick a new country"
    puts "3: to exit"
    @input=gets.strip
    puts ""
    response_checker(3)
    if @input=="1"
      printing_sites
    elsif @input=="2"
      call_country
    else
      goodbye
      abort
    end
  end
  
  def goodbye
    puts "I hope you enjoyed yourself and learned something new!"
    puts "All of this information was found throughout the whc.unesco.org website!"
    puts "Have a swell day!"
  end
end
#could have it so the user could enter something and a random number would be chosen, I think it would be easy to implement, 
#but i'm not sure how to have the user select because right now all of the user input is number based, it can't be 0 because
#all letters are transformed to 0 in the valididity check, i could have it be one greater than the largest number in the series,
#but I don't really love that idea, so right now I will leave it out