class UNESCOWorldHeritageSites::Countries
  attr_accessor :id, :name, :url, :sites
  @@all=[]
  @@found_name=""
  @@found_url=""
  @@found_id=""
  
  
  
  def initialize(id,name,url)
    @id=id
    @name=name
    @url=url
  end
  
  def save
    @@all << self 
  end
  
  def self.new_from_index(id,name,url)
    new_country=UNESCOWorldHeritageSites::Countries.new(id,name,url)
    new_country.save
    new_country
  end
  
  def sites_of_country
    @sites=[]
    doc=Nokogiri::HTML(open(@url))
    descriptors_array=[".cultural_danger>a",".cultural>a",".natural>a",".natural_danger>a",".mixed>a"]
    descriptors_array.each do |descriptor|
    doc.css(descriptor).each do |site|
      name=site.text
      url="http://whc.unesco.org#{site.attr("href")}"
      @sites << [name,url]
                            end
                             end
    create_sites
  end
  
  def self.create_sites
    @sites.each_with_index do |site,i|
    id=i+1
    country=@@found_name
    name=site[0]
    url=site[1]
    UNESCOWorldHeritageSites::Sites.new_from_country(id,country,name,url)
                            end
    return
  end
  def self.country_specific_sites(input_id)
    find_country(input_id)
    @sites=[]
    doc=Nokogiri::HTML(open(@@found_url))
    descriptors_array=[".cultural_danger>a",".cultural>a",".natural>a",".natural_danger>a",".mixed>a"]
    descriptors_array.each do |descriptor|
    doc.css(descriptor).each do |site|
      name=site.text
      url="http://whc.unesco.org#{site.attr("href")}"
      @sites << [name,url]
                            end
                             end
    create_sites   
  end
  
  def self.find_country(id)
    @@all.each do |country|
      if country.id==id.to_i
        @@found_name=country.name
        @@found_url=country.url
        @@found_id=country.id
      end
                end
  end
  
  def self.print_countries
    @@all.each do |country|
        puts "#{country.id}, #{country.name}"
            end
  end
end