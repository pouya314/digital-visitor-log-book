class IndexController < ApplicationController
  def welcome
  end
  
  def returning
    @search = Visitor.search(params[:q])
    unless params[:q].nil? or params[:q].empty?
      @visitors = @search.result
    end
  end
end
