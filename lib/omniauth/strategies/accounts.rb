require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Accounts < OmniAuth::Strategies::OAuth2
      option :name, :accounts

      option :client_options, {
        site: "http://accounts-staging.farmbox.com.br"
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
    end
  end
end
