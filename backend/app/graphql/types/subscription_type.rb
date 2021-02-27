# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :message_was_added, subscription: Subscriptions::MessageWasAdded
  end
end
