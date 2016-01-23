class UNESCOWorldHeritageSites::CLI

  def call
     introduction
     call_country
  end
  
  def introduction
    puts "Hello, we are learning about UNESCO World Heritage Sites"
    puts "Insert Info about UNESCO"
  end
  
  def call_country
    UNESCOWorldHeritageSites::Scraper.scrape_main_page
    UNESCOWorldHeritageSites::Countries.print_countries
    puts "Please select the id of the country you would like to search about"
    response=gets.strip
    UNESCOWorldHeritageSites::Countries.country_specific_sites(response)
    UNESCOWorldHeritageSites::Sites.print_all_sites
    puts "Which site would you like to learn more about?"
    site_response=gets.strip
    site=UNESCOWorldHeritageSites::Sites.find_site(site_response)
    site.print_site_data
    abort
   # puts "Would you like to exit, go back to the country page, or start over?"
   # end_response=gets.strip
  end
end