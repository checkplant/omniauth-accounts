require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Accounts < OmniAuth::Strategies::OAuth2
      option :name, :accounts

      option :client_options, {
        site: Rails.env.production? ? "https://accounts.farmbox.cc" : "https://accountstest.farmbox.cc"
      }

      uid { raw_info['uuid'] }

      info do
        {
          email: raw_info["email"],
          username: raw_info["username"]
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end

      # You can pass params to the auth request, if you need to set them dynamically.
      # You can also set these options in the OmniAuth config :authorize_params option.
      #
      # For example: /auth/accounts?sign_up=true
      def authorize_params
        super.tap do |params|
          %w[sign_up].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end
    end
  end
end
