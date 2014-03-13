class Admin::VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /visitors
  # GET /visitors.json
  def index
    # @visitors = Visitor.order(created_at: :desc)
    # 
    # if params[:namecontains]
    #   @visitors = @visitors.where('name like ?', "%#{params[:namecontains]}%")
    # end
    
    
    @search = Visitor.search(params[:q])
    @visitors = @search.result.order(created_at: :desc)
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to admin_visitor_path(@visitor), notice: 'Visitor was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @visitor }
      else
        format.html { render action: 'new' }
        # format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to admin_visitor_path(@visitor), notice: 'Visitor was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to admin_visitors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:name, :photo, :department, :email, :phone, :reason)
    end
end
