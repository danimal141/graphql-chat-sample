# frozen_string_literal: true

module Subscriptions
  class MessageWasAdded < Subscriptions::BaseSubscription
    field :message, String, null: true
    # argument :room, String, required: true

    def subscribe
      { message: nil }
    end

    def update
      { message: object[:message] }
    end
  end
end
