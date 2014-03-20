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

  def increment_count
  	self.update_attribute(:visit_count, self.visit_count + 1)
  end
  

end