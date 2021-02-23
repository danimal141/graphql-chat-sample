# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :sub, ID, null: false
    field :name, String, null: false
    field :messages, [Types::MessageType], null: false
  end
end
