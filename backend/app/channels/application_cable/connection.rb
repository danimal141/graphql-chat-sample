# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # [CAUTION] Ignore authentication

    # identified_by :current_user

    # def connect
    #   self.current_user = find_verified_user
    # end

    # private

    # def find_verified_user
    #   if current_user = User.from_token_payload(auth_payload)
    #     current_user
    #   else
    #     reject_unauthorized_connection
    #   end
    # end

    # def auth_payload
    #   auth_payload, = retrieve_auth_token
    #   auth_payload
    # rescue JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordInvalid
    #   nil
    # end

    # def retrieve_auth_token
    #   JsonWebToken.verify(http_token)
    # end

    # def http_token
    #   request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    # end
  end
end
