# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :projects, dependent: :destroy

  enum :status, { reviewed: 'reviewed', approved: 'approved', rejected: 'rejected' }, default: :reviewed
  enum :plan, { free: 'free', premium: 'premium' }, default: :free

  alias_attribute :corporation_name, :name

  def already_usage_started?
    usage_started_at <= Time.current
  end
end
