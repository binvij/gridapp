class CandidateController < ApplicationController
  def index

  	#debugger
  	@comment = Comment.new
  	@candidates = Candidate.all
  	respond_to do |format|
  		format.html 
  		format.json { render json:  CandidatesDatatable.new(view_context)}
  	end
  end

  

  def update

  	#debugger
  	data_arr = params[:aData]
  	#get the record to be modified 
  	id = data_arr[0].to_i
   	#candidate = Candidate.find(id)
   	#debugger
  	col = get_column_name(params[:column])
  	Candidate.update(id, col.intern => params[:value])
 	#debugger
 	redirect_to(:back)
 end 


  private 

  def get_column_name(col_id)
  	colname = ""
  	col_id = col_id.to_i
  	case col_id
	  	when 0 then colname = ""
	  	when 1 then colname = "first_name"
	  	when 2 then colname = "last_name"
	  	when 3 then colname = "email"
	  	when 4 then colname = "looking_for_change"
  	end 	

  end 

end
