class DashboardController < ApplicationController
	def index
		@website_list = Visit.get_website_list
		@page_list = Visit.get_page_list

      	if request.post?
      		website_id = params[:website_id]
      		page = params[:page]
      		duration = params[:duration]
      		@dashboard_data = fetch_dashboard_data(website_id, page, duration)
      	end
	end

	private

	def fetch_dashboard_data(website_id, page, duration)
		duration_param1, duration_param2 = find_dates(duration)
	    Visit.get_dashboard_data(website_id, page, duration_param1, duration_param2, duration)
	end

	def find_dates(duration)
		today_start = Date.today
	    tomorrow_start = Date.tomorrow
	    case duration
	    when 'Last month'
	      duration_param1 = (today_start - 1.month)
	      duration_param2 = today_start
	    when 'Last week'
	      duration_param1 = (today_start - 1.week)
	      duration_param2 = today_start
	    when 'Yesterday'
	      duration_param1 = (today_start - 1.day)
	      duration_param2 = (today_start - 1.minute)
	    when 'Today'
	      duration_param1 = today_start
	      duration_param2 = (tomorrow_start - 1.minute)
	    end
	    return duration_param1.to_s, duration_param2.to_s
	end
end
