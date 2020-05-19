require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sso < OmniAuth::Strategies::OAuth2
      option :name, :sso

      option :client_options, {
        site: "https://www.farmbox.cc"
      }

      uid { raw_info['_id']['$oid'] }

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
