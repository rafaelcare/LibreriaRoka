class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

<<<<<<< HEAD
    # GET /example_orders
  # GET /example_orders.json
=======
  # GET /orders
  # GET /orders.json
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
  def index
    @orders = Order.all
  end

<<<<<<< HEAD
  # GET /example_orders/1
  # GET /example_orders/1.json
  def show
  end

  # GET /example_orders/new
  def new
    @order = Order.new
    @order.client = Client.new
  end

  # GET /example_orders/1/edit
  def edit
  end

  # POST /example_orders
  # POST /example_orders.json
  def create
    
  end

  # PATCH/PUT /example_orders/1
  # PATCH/PUT /example_orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Example order was successfully updated.' }
=======
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  # DELETE /example_orders/1
  # DELETE /example_orders/1.json
=======
  # DELETE /orders/1
  # DELETE /orders/1.json
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
<<<<<<< HEAD
      params.require(:order).permit(:usuario_id, :client_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado)      
    end

=======
      params.require(:order).permit(:usuario_id, :client_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado)
    end
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
end
