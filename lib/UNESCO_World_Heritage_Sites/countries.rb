class UNESCOWorldHeritageSites::Countries
  attr_accessor :id, :name, :url, :sites, :doc

  @@all=[]

  def initialize(id,name,url)
    @id=id
    @name=name
    @url=url
  end
  
  def save
    @@all << self 
  end
  
  def self.create_from_index(id,name,url)
    new_country=UNESCOWorldHeritageSites::Countries.new(id,name,url)
    new_country.save
    new_country
  end
  
  def scrape_countrys
    @doc=Nokogiri::HTML(open(self.url))
  end
  
  def country_specific_sites
    scrape_countrys
    @sites=[]
    descriptors_array=[".cultural_danger>a",".cultural>a",".natural>a",".natural_danger>a",".mixed>a"]
    descriptors_array.each do |descriptor|
    @doc.css(descriptor).each do |site|
      name=site.text
      url="http://whc.unesco.org#{site.attr("href")}"
      @sites << [name,url]
                            end
                             end
    create_sites   
  end
  
  def create_sites
    @sites.each_with_index do |site,i|
    id=i+1
    country=self.name
    name=site[0]
    url=site[1]
    UNESCOWorldHeritageSites::Sites.create_from_country(id,country,name,url)
                            end
    return
  end
  
  def self.find_country(id)
    @@all.each do |country|
      if country.id==id.to_i
       return country
      end
                end
  end
  
  def self.print_countries
    @@all.each do |country|
        puts "#{country.id}, #{country.name}"
            end
  end
  
  def self.number_of_countries
    @@all.length
  end
end