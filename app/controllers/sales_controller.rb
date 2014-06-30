class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  #before_filter :require_login, only: [:new, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    #Asociar el cliente
    @sale.client = Client.new  
    @sale.usuario_id = current_user    
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    #se habilito strong parameters en el modelo
    @sale = Sale.new(sale_params)
    client = Client.new(client_params)   
    @sale.fecha = Time.new
   
    if @sale.client_id.nil?
      @sale.client = client
    else
      @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
      @sale.client.direccion = client.direccion       
      @sale.client.rfc = client.rfc       
      @sale.client.apellidos = client.apellidos 
      @sale.client.telefono = client.telefono
      @sale.client.telefono = client.telefono
      @sale.client.email = client.email
      @sale.client.facebook = client.facebook
      @sale.client.lynkedin = client.lynkedin
    end

    puts "Datos recibidos de la nueva venta"
 #   @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
    puts "Cliente>> " + @sale.client_id.to_s + @sale.client.nombre
    puts "Productos recibidos: "     
    
    @sale.saleDetails.each do |item|
    # #params[:saledetails].each do |item|
       puts "id: " + item.product_id.to_s + ", p. u: " + item.preciounitario.to_s + ", cantidad: " + item.cantidad.to_s +
        ", importeTotalVenta: " + item.importetotal.to_s 
    end     
     respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
     end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:importetotal, :usuario_id, :fecha, :client_id, :saleDetails_attributes => [:importetotal, :product_id, :cantidad, :preciounitario, :descuento, :total])
      #params.require(:sale).permit(:usuario_id, :fecha, :client_id, :importetotal, detailsSales => detailsSales[:importetotal, :product_id, :cantidad, :preciounitario, :descuento, :total])
    end

    def client_params
      params.require(:client).permit(:rfc, :nombre, :apellidos, :telefono, :direccion, :facebook, :lynkedin, :email)
    end
end