class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /order_details
  def index
    @order_details = OrderDetail.all
  end

  # GET /order_details/1
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details
  def create
    @order_detail = OrderDetail.new(order_detail_params)
    respond_to do |format|
      if @order_detail.save
         format.html {redirect_to @order_detail, notice: 'Order detail was successfully created.'}
         format.json { render :show, status: :created location: @order_detail}
      else
         format.html { render :new}
         format.json { reader json: @order_detail.errors, status: :unprocessable_entity}
     end
    end
  end

  # PATCH/PUT /order_details/1
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
       format.html { redirect_to @order_detail, notice: 'Order detail was successfully updated.'}
       format.json { reader :show, status: :ok, location: @order_detail}
      else  
        format.html {render :edit }
        format.json {reader json: @order_detail.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /order_details/1
  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_details_url, notice: 'Order detail was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_detail_params
      params.require(:order_detail).permit(:usuario_id, :order_id, :product_id, :importetotal, :preciounitario, :cantidad, :descuento)
    end
end
