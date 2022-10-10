# frozen_string_literal: true

class AddCorporationRefToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :corporation, null: false, foreign_key: true
  end
end
