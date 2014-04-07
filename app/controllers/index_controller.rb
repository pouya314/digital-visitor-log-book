class IndexController < ApplicationController
  http_basic_authenticate_with name: ENV["MASTER_USER"], password: ENV["MASTER_PASS"]


  def welcome
  end
  
  def returning
    @search = Visitor.search(params[:q])
    unless params[:q].nil? or params[:q].empty?
      @visitors = @search.result
    end
  end
end
