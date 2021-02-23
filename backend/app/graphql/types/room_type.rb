# frozen_string_literal: true

module Types
  class RoomType < Types::BaseObject
    field :name, String, null: false
    field :messages, [Types::MessageType], null: false do
      argument :last, Integer, required: false, default_value: 20
    end

    private

    def messages(last:)
      if last > 50 || last < 0
        raise GraphQL::ExecutionError, "`last` must be greater than 0 and less than 50"
      end
      object.messages.last(last)
    end
  end
end
