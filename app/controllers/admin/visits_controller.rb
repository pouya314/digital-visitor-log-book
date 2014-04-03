class Admin::VisitsController < ApplicationController
  layout "admin"

  before_action :set_visit, only: [:show]
  before_action :authenticate_admin!
  
  # GET /visits
  # GET /visits.json
  def index
    # @search = Visitor.search(params[:q])
    # @size_returned = @search.result.size
    # @visitors = @search.result.order(created_at: :desc).page(params[:page]).per(5)
    
    @visits = Visit.all
  end


  # GET /visits/1
  # GET /visits/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end
end
