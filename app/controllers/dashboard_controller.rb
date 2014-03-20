class DashboardController < ApplicationController
	def index
		@website_list = Visit.get_website_list
		@page_list = Visit.get_page_list(1)

		if params[:ajax_website_id]
			@page_list = Visit.get_page_list(params[:ajax_website_id])
			
      		# render(:update){|page|
      		# 	page.replace_html 'select_page' , :partial => "shared/page_drop_down_partial"
      		# }
      		render :update do |page|
  				page.replace_html :select_page, :partial => 'page_drop_down_partial', :object => @page_list
			end
			# render :inline => "<%= options_for_pages(@page_list) %>"
      	end

      	if request.post?
      		website_id = params[:website_id]
      		page = params[:page]
      		duration = params[:duration]
      		@dashboard_data = fetch_dashboard_data(website_id, page, duration)
      		# render(:update){|page| page.replace_html :update_sub_report, :partial => "shared/dashboard_data_partial.html"} and return
      		puts "Success"
      		render "shared/dashboard_data_partial.html"
      	end
	end

	def dashboard_data
		website_id = params[:website_id]
      	page = params[:page]
     	duration = params[:duration]
      	@dashboard_data = fetch_dashboard_data(website_id, page, duration)
	end

	private

	def fetch_dashboard_data(website_id, page, duration)
	    
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

	    duration_param1 = duration_param1.to_s
	    duration_param2 = duration_param2.to_s
	    duration_str = (duration == 'All') ? "" : "and visit_date >= '#{duration_param1}' and visit_date <= '#{duration_param2}' "
	    select = "SELECT website_id, page, visit_date, visit_count, ip, browser, device FROM visits "
	    condition = "where website_id = ? and page = ? "
	    query = select+condition+duration_str
	    Visit.find_by_sql([query, website_id, page])
	end
end
