# app/controllers/concerns/response.#!/usr/bin/env ruby -wKU
module Response
  def json_response(object, status = :ok)
    render json: object.to_json(only: [:id, :nombre, :apellido, :usuario, :twitter]), status: status
  end
end