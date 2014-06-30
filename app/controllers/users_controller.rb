class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url#, :notice => "Se ha creado el usuario con exito"
    else
      render :new
    end
  end
   
  def destroy
    logout
    redirect_to root_url
    #, :notice => "Logged out!"
  end

  def edit
  end

  def update
  end  

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :nombre, :apellidos, :direccion, :telefono, :tipoUsuario)
  end
end
