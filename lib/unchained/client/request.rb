require 'rest-client'

module Unchained
  class Client
    module Request

      def get(url, params={})
        RestClient.get(url, build_params(params)) do |resp, req, res, &block|
          case resp.code
          when 200
            JSON.parse(resp)
          else
            resp.return!(req, res, &block)
          end
        end
      end

      private

      def default_params
        {
          loginToken: login_token,
          accept: :json,
        }
      end

      def build_params(params)
        default_params.merge(params)
      end

    end
  end
end
