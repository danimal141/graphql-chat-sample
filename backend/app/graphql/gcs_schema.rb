# frozen_string_literal: true

class GcsSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  subscription(Types::SubscriptionType)

  context_class(GcsSchema::CustomContext)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  # subscription with ActionCable
  use GraphQL::Subscriptions::ActionCableSubscriptions
end
