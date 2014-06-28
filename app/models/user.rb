<<<<<<< HEAD
class User < ActiveRecord::Base
 
end
=======
class User < ActiveRecord::Base
  authenticates_with_sorcery!
end
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
