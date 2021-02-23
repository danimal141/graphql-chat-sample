# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  # ヘルスチェック
  mount KomachiHeartbeat::Engine => '/ops'
end
