# frozen_string_literal: true

class AddPlanToCorporations < ActiveRecord::Migration[7.0]
  def change
    add_column :corporations, :plan, :string, null: false, default: 'free'
  end
end
