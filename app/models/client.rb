class Client < ActiveRecord::Base
	has_many :sales
	has_many :orders
	validates :email, :presence => {:message => "Ingrese un email"}
	validates :nombre, :presence => {:message => "Ingrese un nombre" }
	validates :rfc, :presence => {:message => "Ingrese un RFC" }
	validates :apellidos, :presence => {:message => "Ingrese los apellidos" }
	validates :direccion, :presence => {:message => "Ingrese la direccion" }
	validates :telefono, :presence => {:message => "Ingrese un telefono" }	

	def self.search(search)
	  if search
	    find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])	  
	  end
	end
end
