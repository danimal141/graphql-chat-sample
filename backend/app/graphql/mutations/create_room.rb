# frozen_string_literal: true

class Mutations::CreateRoom < Mutations::LoginRequiredMutation
  field :room, Types::RoomType, null: true
  field :errors, [String], null: false

  argument :name, String, required: true

  def resolve(name:)
    room = Room.new(name: name)
    p '----------'
    if room.save
      { room: room, errors: [] }
    else
      { room: nil, errors: room.errors.full_messages }
    end
  end
end
