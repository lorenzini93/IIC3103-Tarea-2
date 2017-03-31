class Api::UsuariosController < ApplicationController
  respond_to :json

  # Mostrar usuarios
  def index
    usuarios = Usuario.all
    render json: usuarios
  end

  # Mostrar usuario
  def show
    respond_with Usuario.find(params[:id])
  end

  # Crear usuario
  def create
   usuario=Usuario.new(user_params) 
        # if the user is saved successfully than respond with json data and status code 201
        if usuario.save 
    render json: usuario, status: 201
   else
    render json: { errors: usuario.errors}, status: 422
   end
  end

  # Update usuario
  def update
    usuario = Usuario.find(params[:id])

    if usuario.update(user_params)
      render json: usuario, status: 200
    else
      render json: { errors: usuario.errors }, status: 422
    end
  end

  # Eliminar usuario
  def destroy
    usuario = Usuario.find(params[:id])
    usuario.destroy
    head 204
  end

  private
  def user_params
   params.require(:usuario).permit(:usuario, :nombre) 
  end
end  
