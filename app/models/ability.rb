class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new
	if user.admin?
		
		can :manage, :all
		  
	else
		
		can :update, Link do |link|
			link.user == user
		end
		
		can :destroy, Link do |link|
			link.user == user
		end
		
		can :destroy, Comment do |comment|
			comment.user == user
		end
		
		can :create, Link
		can :create, Comment
#	else
		can :read, :all
	end
  end
end
