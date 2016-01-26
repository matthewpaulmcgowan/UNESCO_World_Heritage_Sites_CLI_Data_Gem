class UNESCOWorldHeritageSites::Scraper
  def self.scrape_main_page
    doc=Nokogiri::HTML(open("http://whc.unesco.org/en/list"))
    doc.css("#acc>h4>a").each_with_index do |country,i|
      name=country.text
      url="http://whc.unesco.org#{country.attr("href")}"
      index=i+1
      UNESCOWorldHeritageSites::Countries.create_from_index(index,name,url)
                         end
  end
end


