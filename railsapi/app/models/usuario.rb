class Usuario < ActiveRecord::Base
	validates_presence_of :usuario, :nombre
end
