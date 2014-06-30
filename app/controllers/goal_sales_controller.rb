class GoalSalesController < ApplicationController
  before_action :set_goal_sale, only: [:show, :edit, :update, :destroy]

  # GET /goal_sales
  def index
    @goal_sales = GoalSale.all
  end

  # GET /goal_sales/1
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
  def create
    @goal_sale = GoalSale.new(goal_sale_params)

    if @goal_sale.save
      redirect_to @goal_sale, notice: 'Goal sale was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /goal_sales/1
  def update
    if @goal_sale.update(goal_sale_params)
      redirect_to @goal_sale, notice: 'Goal sale was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goal_sales/1
  def destroy
    @goal_sale.destroy
    redirect_to goal_sales_url, notice: 'Goal sale was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_sale
      @goal_sale = GoalSale.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_sale_params
      params.require(:goal_sale).permit(:usuario_id, :alcanzado, :fechainicio, :fechafin)
    end
end
