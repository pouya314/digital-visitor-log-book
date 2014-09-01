class VisitsController < ApplicationController
  # http_basic_authenticate_with name: ENV["MASTER_USER"], password: ENV["MASTER_PASS"]
  

  def new
    @visitor = Visitor.find(params[:data])
    @visit = Visit.new
  end


  def create
    @visit = Visit.new(visit_params)
    @visitor = Visitor.find(@visit.visitor_id)

    respond_to do |format|
      if @visit.save
        format.html { redirect_to root_path, notice: 'Thank you for registering your details. You may now proceed!' }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def visit_params
      params.require(:visit).permit(:visitor_id, :from_company, :person_to_meet, :company_to_visit)
    end
end
