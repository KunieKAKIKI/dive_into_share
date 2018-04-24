class Ability
  include CanCan::Ability

  def initialize(user, team)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :access, :rails_admin
      can :manage, :all
    end

    can :read, User

    if user.can_edit_team?(team)
      can :manage, [Category, Comment, Membership, Post, TeamEditRight, Team]
    else
      can :read, Category
      can :manage, [Comment, Post, TeamEditRight]
      can %i[read create], Team
    end

    #elsif user.team_edit_rights()  #ユーザがチームの編集権を持つ場合
    #  can :manage, Team do |team| #編集できるチームを特定したい
    #    team == user.team
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
end
