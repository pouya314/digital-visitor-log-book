class Admin::VisitsController < ApplicationController
  layout "admin"

  before_action :set_visit, only: [:show]
  before_action :authenticate_admin!
  
  def index
    @search = Visit.search(params[:q])
    @size_returned = @search.result(distinct: true).size
    @visits = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(5)
  end


  def show
  end


  private
  
    def set_visit
      @visit = Visit.find(params[:id])
    end
end
