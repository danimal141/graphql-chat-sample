# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :sub, ID, null: false
  end
end
