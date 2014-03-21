class Visit < ActiveRecord::Base
  attr_accessible :website_id, :page, :visit_count, :visit_date, :browser, :device, :ip


  def self.find_page_record(params)
  	record = Visit.where("website_id = ? AND page = ? AND visit_date = ? AND ip = ? AND browser = ?", params[:website_id], params[:page], Date.today, params[:ip], params[:browser]).last
  end

  def self.create_record(hash)
  	Visit.create(hash)
  end

  def self.get_website_list
    Visit.select(:website_id).uniq
  end

  def self.get_page_list(id)
    Visit.select(:page).where(:website_id => id).uniq
  end

  def self.get_page_list
    Visit.select(:page).uniq
  end

  def self.get_dashboard_data(website_id, page, duration_param1, duration_param2, duration)
    duration_str = (duration == 'All') ? "" : "and visit_date >= '#{duration_param1}' and visit_date <= '#{duration_param2}' "
    website_str = (website_id == "All") ? "": "and website_id = '#{website_id}' "
    page_str = (page == "All") ? "": "and page = '#{page}' "
    select = "SELECT website_id, page, visit_date, visit_count, ip, browser, device FROM visits "      
    condition = (duration_str+website_str+page_str).blank? ? "": "where 1 "
    query = select+condition+duration_str+website_str+page_str
    Visit.find_by_sql([query])
  end

  def increment_count
  	self.update_attribute(:visit_count, self.visit_count + 1)
  end
  

end