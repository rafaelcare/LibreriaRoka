class Product < ActiveRecord::Base

	def self.search(search)
      if search
        where('nombre LIKE ?', "%#{search}%")
      else
        scoped
    end
  end
end
