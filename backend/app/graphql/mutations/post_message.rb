# frozen_string_literal: true

class Mutations::PostMessage < Mutations::LoginRequiredMutation
  field :message, String, null: true
  field :errors, [String], null: false

  argument :room, String, required: true
  argument :message, String, required: true

  def resolve(room:, message:)
    room = Room.find_by(name: room)
    new_message = room.messages.build(user: context.current_user, body: message)
    if new_message.save
      # IRL this should probably be an after-commit hook.
      # GcsSchema.graphql_definition.subscriptions.trigger(:messageWasAdded, { room: room }, message)
      GcsSchema.graphql_definition.subscriptions.trigger(:messageWasAdded, {}, { message: new_message.body })
      { message: new_message.body, errors: [] }
    else
      { message: nil, errors: new_message.errors.full_messages }
    end
  end
end
