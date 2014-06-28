class GoalSalesController < ApplicationController
  before_action :set_goal_sale, only: [:show, :edit, :update, :destroy]

  # GET /goal_sales
  # GET /goal_sales.json
  def index
    @goal_sales = GoalSale.all
  end

  # GET /goal_sales/1
  # GET /goal_sales/1.json
  def show
  end

  # GET /goal_sales/new
  def new
    @goal_sale = GoalSale.new
  end

  # GET /goal_sales/1/edit
  def edit
  end

  # POST /goal_sales
  # POST /goal_sales.json
  def create
    @goal_sale = GoalSale.new(goal_sale_params)

    respond_to do |format|
      if @goal_sale.save
        format.html { redirect_to @goal_sale, notice: 'Goal sale was successfully created.' }
        format.json { render :show, status: :created, location: @goal_sale }
      else
        format.html { render :new }
        format.json { render json: @goal_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_sales/1
  # PATCH/PUT /goal_sales/1.json
  def update
    respond_to do |format|
      if @goal_sale.update(goal_sale_params)
        format.html { redirect_to @goal_sale, notice: 'Goal sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_sale }
      else
        format.html { render :edit }
        format.json { render json: @goal_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_sales/1
  # DELETE /goal_sales/1.json
  def destroy
    @goal_sale.destroy
    respond_to do |format|
      format.html { redirect_to goal_sales_url, notice: 'Goal sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_sale
      @goal_sale = GoalSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_sale_params
      params.require(:goal_sale).permit(:usuario_id, :alcanzado, :fechainicio, :fechafin)
    end
end
