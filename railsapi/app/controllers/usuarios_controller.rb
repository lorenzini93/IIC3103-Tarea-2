class UsuariosController < ApplicationController
  respond_to :json
  before_action :set_user, only: [:show, :update, :destroy]

  # Mostrar usuarios
  def index
    @usuarios = Usuario.all
    #render json: {usuarios:, @usuarios, usuarios.size}
    
    json_response(@usuarios)
    #render json: usuarios
  end

  # Mostrar usuario
  def show
    #respond_with Usuario.find(params[:id])
    json_response(@usuario)
  end

  # Crear usuario
  def create

  if (params.has_key?(:id))
    render json: { error: "No se puede crear usuario con id" }, status: :bad_request
  else
    @usuario = Usuario.create!(user_params)
    json_response(@usuario, :created)
  end
   

   #usuario=Usuario.new(user_params) 
    #    # if the user is saved successfully than respond with json data and status code 201
     #   if usuario.save 
    #render json: usuario, status: 201
   #else
   # render json: { errors: usuario.errors}, status: 422
   #end
  end

  # Update usuario
  def update
    #@usuario.update(user_params)
    if (params.has_key?(:id))
      render json: { error: "id no es modificable" }, status: :bad_request
    else
      usuario = Usuario.find(params[:id])

      if usuario.update(user_params)
        render json: usuario, status: :ok
      else
        render json: { error: "La modificación ha fallado" }, status: :internal_server_error
      end
    end
  end

  # Eliminar usuario
  def destroy
    #usuario = Usuario.find(params[:id])
    @usuario.destroy
    head :no_content
  end

  private
  def user_params
   params.permit(:usuario, :nombre, :apellido, :twitter) 
  end

  def set_user
    @usuario = Usuario.find(params[:id])
  end
end  
