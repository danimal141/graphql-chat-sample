# frozen_string_literal: true

module Resolvers
  class RoomResolver < LoginRequiredResolver
    type Types::RoomType, null: false

    argument :name, String, required: true

    def resolve(name:)
      ::Room.find_or_create_by(name: name)
    end
  end
end
