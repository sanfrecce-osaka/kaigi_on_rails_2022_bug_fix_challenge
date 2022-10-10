# frozen_string_literal: true

class AddCorporationRefToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :corporation, null: false, foreign_key: true
  end
end
