module DashboardHelper
	def options_for_website(website_list, selected = nil ,value_method = :website_id, text_method = :website_id)
	    collection = website_list
	    options = '<option value="--" selected="selected">Select a Website</option>'
	    options << '<option value="All">All Websites</option>'
	    options << options_from_collection_for_select(collection, value_method, text_method, selected)
	    options.html_safe
  	end

  	def options_for_pages(page_list, selected = nil ,value_method = :page, text_method = :page)
	    collection = page_list
	    options = '<option value="--" selected="selected">Select a Page</option>'
	    options << '<option value="All">All Pages</option>'
	    options << options_from_collection_for_select(collection, value_method, text_method, selected)
	    options.html_safe
  	end

  	def options_for_duration(selected = nil)
	    duration_order = ["--Select--","All", "Today", "Yesterday","Last week", "Last month"]
	    options = []
	    duration_order.each_index do |i|
	      options << duration_order[i]
	    end
	    options = options_for_select(options, selected)
  end
end
