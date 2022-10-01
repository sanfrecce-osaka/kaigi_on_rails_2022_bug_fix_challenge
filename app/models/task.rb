# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project

  enum :status, { todo: 'ToDo', doing: 'Doing', done: 'Done' }, default: :todo
end
