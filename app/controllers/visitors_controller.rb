class VisitorsController < ApplicationController
  # http_basic_authenticate_with name: ENV["MASTER_USER"], password: ENV["MASTER_PASS"]
  

  def new
    @visitor = Visitor.new
    @visitor.visits.build
  end


  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to root_path, notice: 'Thank you for registering your details. You may now proceed!' }
        # format.json { render action: 'show', status: :created, location: @visitor }
      else
        format.html { render action: 'new' }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  
    def visitor_params
      params.require(:visitor).permit(:name, :photo, visits_attributes: [:id, :from_company, :person_to_meet, :company_to_visit])
    end
end
