class UNESCOWorldHeritageSites::CLI
  attr_accessor :input
  
  def call
    introduction
    call_country
  end
  
  def introduction
    puts "Hello, we are learning about UNESCO World Heritage Sites"
    puts "Insert Info about UNESCO"
  end
  
  def call_country
    UNESCOWorldHeritageSites::Sites.clear
    UNESCOWorldHeritageSites::Scraper.scrape_main_page
    UNESCOWorldHeritageSites::Countries.print_countries
    puts "Please select the id of the country you would like to search about"
    @input=gets.strip
    response_checker(UNESCOWorldHeritageSites::Countries.number_of_countries)
    chosen_country=UNESCOWorldHeritageSites::Countries.find_country(@input)
    chosen_country.country_specific_sites
    printing_sites
  end
  
  def printing_sites
    UNESCOWorldHeritageSites::Sites.print_all_sites
    puts "Which site would you like to learn more about?"
    @input=gets.strip
    response_checker(UNESCOWorldHeritageSites::Sites.number_of_sites)
    site=UNESCOWorldHeritageSites::Sites.find_site(@input)
    site.print_site_data
    puts "Please enter 1 to pick a new country, 2 to look at the same country's sites, or 3 to exit"
    @input=gets.strip
    response_checker(3)
    if @input=="1"
      call_country
    elsif @input=="2"
      printing_sites
    else
      abort
    end
  end
  
  def look_at_country_sites_again
    printing_sites
  end
  
  def response_checker(high_limit) 
    if !(@input.to_i>0)||!(@input.to_i<=high_limit)
      puts "Please enter a valid response."
      @input=gets.strip
      response_checker(high_limit)
    end
  end
end