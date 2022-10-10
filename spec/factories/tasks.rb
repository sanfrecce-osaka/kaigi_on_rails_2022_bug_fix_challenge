# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    project { nil }
    status { 'MyString' }
  end
end
