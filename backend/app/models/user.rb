# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages
  validates :name, uniqueness: true

  class << self
    def from_token_payload(payload)
      return if payload.blank?

      self.find_or_create_by!(sub: payload['sub'])
    end
  end
end
