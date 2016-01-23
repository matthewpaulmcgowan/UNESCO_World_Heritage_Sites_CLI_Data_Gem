class UNESCOWorldHeritageSites::Sites
  attr_accessor :id,:country, :name, :url, :doc
  
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
  
  def self.create_from_country(id,country,name,url)
    new_site=UNESCOWorldHeritageSites::Sites.new(id,country,name,url)
    new_site.save
    new_site
  end
  
  def self.print_all_sites
    @@all.each do |site|
      puts "#{site.id}, #{site.name}"
                end
  end
  
  def self.find_site(input_id)
    @@all.detect do |site|
      site.id==input_id.to_i
                end
  end 
  
  def scrape_sites
    @doc=Nokogiri::HTML(open(url)) 
  end
  
  def print_site_data
    scrape_sites
    overview=@doc.css("#contentdes_en>p").text
    puts self.name
    puts self.country
    puts overview
    puts self.url
  end
  
  def self.number_of_sites
    @@all.length
  end
  
  def self.clear
    @@all=[]
  end
end