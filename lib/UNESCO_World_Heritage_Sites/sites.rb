class UNESCOWorldHeritageSites::Sites
  attr_accessor :id,:country, :name, :url
  
  @@all=[]
  
  def initialize(id,country,name,url)
    @id=id
    @country=country
    @name=name
    @url=url
  end
  
  def save
    @@all << self 
  end
  
  def self.new_from_country(id,country,name,url)
    new_site=UNESCOWorldHeritageSites::Sites.new(id,country,name,url)
    new_site.save
    new_site
  end
  
  def self.print_all_sites
      puts @@all.length
    @@all.each do |site|
      puts "#{site.id}, #{site.name}"
                end
  end
  
  def self.find_site(input_id)
    @@all.each do |site|
      if site.id==input_id.to_i
        return site
      end
                end
  end 
  
  def print_site_data
    doc=Nokogiri::HTML(open(url))
    overview=doc.css("#contentdes_en>p").text
    puts self.name
    puts self.country
    puts overview
    puts self.url
  end
  
end