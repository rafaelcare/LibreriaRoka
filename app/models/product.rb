class Product < ActiveRecord::Base
<<<<<<< HEAD

	def self.search(search)
      if search
        where('nombre LIKE ?', "%#{search}%")
      else
        scoped
    end
  end
=======
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
end
