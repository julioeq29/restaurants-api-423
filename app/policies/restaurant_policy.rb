class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Restaurant.all
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Who can update a restaurant?
    # Only restaurant `owner` can update it
    # record
    # user == current_user
    record.user == user
  end

  def create?
    # Any logged-in user can create a Restaurant
    !user.nil?
  end

  def destroy?
    update?
  end
end
