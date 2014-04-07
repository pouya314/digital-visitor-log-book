class IndexController < ApplicationController
  # http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASS"], only: [:home]


  def welcome
  end
  
  def returning
    @search = Visitor.search(params[:q])
    unless params[:q].nil? or params[:q].empty?
      @visitors = @search.result
    end
  end
end
