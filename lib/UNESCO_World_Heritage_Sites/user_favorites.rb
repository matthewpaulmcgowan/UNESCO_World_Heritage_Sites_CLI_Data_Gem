class UNESCOWorldHeritageSites::User_Favorites
  
  @@all=[]
  
  def self.save(site)
    @@all << site
  end
    
  def self.print_favorites
    puts "List of favorites!"
    @@all.each_with_index do |site,i|
      puts "#{i+1}. #{site.name}, #{site.country}"
                          end
  end
  
  def self.clear_favorites #this is not yet implemented, not sure when is a good time and I am already asking so many questions, don't want to constancly be asking if they want to clear favorites
    @@all=[]
  end
end