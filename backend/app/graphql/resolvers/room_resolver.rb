# frozen_string_literal: true

module Resolvers
  class Roomesolver < LoginRequiredResolver
    type Types::Room, null: false do
      argument :name, String, required: true
    end

    def resolve(name:)
      ::Room.find_or_create_by(name: name)
    end
  end
end
