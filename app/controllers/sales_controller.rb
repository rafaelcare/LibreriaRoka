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
    #@sale.saleDetails << SaleDetail.new(:importetotal => 100, :product_id => 4, :cantidad => 1, :preciounitario => 100, :descuento => 10)
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create        
    #strong parameters >> http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
    #se habilito strong parameters en el modelo
    @sale = Sale.new(sale_params)
    client = Client.new(client_params)   
    @sale.fecha = Time.new
    if user_signed_in? 
      @sale.usuario_id = current_user.id 
    end
    #al recibir los datos, comprobar si existe el cliente, entonces se pueden actualizar sus datos
    # si no existe el cliente, registrar un nuevo    
    if @sale.client_id.nil?
      @sale.client = client
    else      
      @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
      @sale.client.direccion = client.direccion
    end

    puts "Datos recibidos de la nueva venta" 
    puts "Cliente>> " + @sale.client_id.to_s + @sale.client.nombre + @sale.client.rfc
    puts "Productos recibidos: "     
    
    @sale.saleDetails.each do |item|    
      puts "id: " + item.product_id.to_s + ", p. u: " + item.preciounitario.to_s + ", cantidad: " + item.cantidad.to_s +
        ", importeTotalVenta: " + item.importetotal.to_s 
    end     

    #@sale.products.each do |p|
      #puts "IDdelPRODUCTO: " + p.product_id.to_s + ", precio. u: " + p.preciounitario.to_s + ", cantidad: " + p.cantidad.to_s +
        #{}", importeTotalVenta: " + p.importetotal.to_s 
    #end

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