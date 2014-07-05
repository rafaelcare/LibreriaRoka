class Ability
  include CanCan::Ability

  

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    can :read, :all if user.tipoUsuario == "Administrador"
     /  user ||= User.new # guest user (not logged in)
       if user.admin?
         can :read, :all
       else
         can :read, :all
       end
      
        @user = user || User.new # for guest
        @user.roles.each { |tipoUsuario| send(role) }

        if @user.roles.size == 0
          can :read, :all #for guest without roles
        end
    if user.tipoUsuario? :Vendedor
      can :manage, Sale
    end
    if user.tipoUsuario? :Administrador
      can :read, Client
      can :read, Sale
      can :read, Product
      can :read, Order
    end
    if user.tipoUsuario? :Creador
      can :manage, Product
    end/
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

   /def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :product_admin
      can :manage, [Product, Asset, Issue]
    elsif user.role? :product_team
      can :read, [Product, Asset]
      # manage products, assets he owns
      can :manage, Product do |product|
        product.try(:owner) == user
      end
      can :manage, Asset do |asset|
        asset.assetable.try(:owner) == user
      end
    end
  end/
  #can :manage, :all if user.is? :Administrador

  

end
