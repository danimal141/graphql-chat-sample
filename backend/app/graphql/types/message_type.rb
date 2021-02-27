# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    global_id_field :id

    field :room, Types::RoomType, null: false
    field :author, Types::UserType, null: false, method: :user
    field :body, String, null: false
  end
end
