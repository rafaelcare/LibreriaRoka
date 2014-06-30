class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

# GET /orders/1
  # GET /orders/1.json
  def show

    #puts "detalles asociados" + @order.orderDetails.count.to_s
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.client= Client.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    client = Client.new(client_params)

   if @order.client_id.nil?
      @order.client = client
    else
      @order.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
      @order.client.direccion = client.direccion
    end
 #al recibir los datos, comprobar si existe el cliente, entonces se pueden actualizar sus datos
    # si no existe el cliente, registrar un nuevo
    puts "Datos recibidos"
 #   @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
    #puts "Cliente>> "  + @example_order.client.nombre
    puts "Productos recibidos como pedido: "     
    
    @order.orderDetails.each do |item|
    # #params[:saledetails].each do |item|
       puts "id: " + item.id.to_s + ", p. u: " +  ", cantidad: , importe: " 
    end

    respond_to do |format|
      if @order.valid?
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end


  # PATCH/PUT /orders/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
   # DELETE /sales/1.json
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

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit( :client_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado, :orderDetails_attributes => [:importetotal, :product_id, :cantidad, :preciounitario, :descuento, :total] )
    end

    def client_params
      params.require(:client).permit(:rfc, :nombre, :apellidos, :telefono, :direccion, :facebook, :lynkedin, :email)
    end
end
