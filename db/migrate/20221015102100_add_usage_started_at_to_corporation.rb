# frozen_string_literal: true

class AddUsageStartedAtToCorporation < ActiveRecord::Migration[7.0]
  def change
    add_column :corporations, :usage_started_at, :datetime
  end
end
