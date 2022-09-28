# frozen_string_literal: true

class HomesController < ApplicationController
  def show
    redirect_to projects_path
  end
end
