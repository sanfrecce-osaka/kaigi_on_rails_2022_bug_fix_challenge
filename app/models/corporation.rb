# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :projects, dependent: :destroy

  enum :status, { reviewed: 'reviewed', approved: 'approved', rejected: 'rejected' }, default: :reviewed
end
