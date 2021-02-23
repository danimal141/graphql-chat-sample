# frozen_string_literal: true

class Mutations::PostMessage < Mutations::BaseMutation
  field :message, Types::MessageType, null: true
  field :errors, [String], null: false

  argument :room, String, required: true, description: <<~DESC
    The name of the room to post in.
  DESC
  argument :message, String, required: true, description: <<~DESC
    The message to post.
  DESC

  def resolve(room:, message:)
    if !context.current_user
      return { errors: ["Must login to post messages."] }
    end

    room = Room.find_or_create_by(name: room)
    message = room.messages.build(user: context.current_user, body: message)
    if message.save
      # IRL this should probably be an after-commit hook.
      GcsSchema.graphql_definition.subscriptions.trigger(:messageWasAdded, { room: room }, message)
      { message: message, errors: [] }
    else
      { message: nil, errors: message.errors.full_messages }
    end
  end
end
