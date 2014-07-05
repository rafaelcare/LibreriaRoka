class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :sale
  ROLES = %w[admin vendedor creador]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   #validates :username, :uniqueness => true#, :length => { :in => 3..20 }  

  #attr_accessor :password
  
end
