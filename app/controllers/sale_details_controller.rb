class SaleDetailsController < ApplicationController
  before_action :set_sale_detail, only: [:show, :edit, :update, :destroy]

  # GET /sale_details
  def index
    @sale_details = SaleDetail.all
  end

  # GET /sale_details/1
  def show
  end

  # GET /sale_details/new
  def new
    @sale_detail = SaleDetail.new
  end

  # GET /sale_details/1/edit
  def edit
  end

  # POST /sale_details
  def create
    @sale_detail = SaleDetail.new(sale_detail_params)

    if @sale_detail.save
      redirect_to @sale_detail, notice: 'Sale detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sale_details/1
  def update
    if @sale_detail.update(sale_detail_params)
      redirect_to @sale_detail, notice: 'Sale detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sale_details/1
  def destroy
    @sale_detail.destroy
    redirect_to sale_details_url, notice: 'Sale detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_detail
      @sale_detail = SaleDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sale_detail_params
      params.require(:sale_detail).permit(:sale_id, :product_id, :importetotal, :preciounitario, :cantidad, :descuento)
    end
end
