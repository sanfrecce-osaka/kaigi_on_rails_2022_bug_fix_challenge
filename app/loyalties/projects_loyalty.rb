# frozen_string_literal: true

class ProjectsLoyalty < ApplicationLoyalty
  def index?
    user.corporation.premium?
  end

  def show?
    user.corporation.premium?
  end

  def create?
    user.corporation.premium?
  end

  def update?
    user.corporation.premium?
  end
end
