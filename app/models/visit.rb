class Visit < ActiveRecord::Base
  attr_accessible :browser, :device, :ip, :page_id, :visit_count, :visit_date
end
