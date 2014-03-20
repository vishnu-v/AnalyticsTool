class VisitsController < ApplicationController

def send_to_analytics
	record = Visit.find_page_record(params)
	if record
		record.increment_count
	else
		hash = build_hash(params)
		Visit.create_record(hash)
	end
	respond_to do |format|
    	format.json { render json: "1", :status => :ok}
  	end
end

private

def build_hash(params)
  	hash = {
		:website_id => params[:website_id],
		:page => params[:page],
		:visit_date => Date.today,
		:visit_count => 1,
		:ip => params[:ip],
		:browser => params[:browser],
		:device => params[:device]
	}
 end

end
