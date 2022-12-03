class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.is?(:guest)

    can :manage, Url, user_id: user.id
  end
end
