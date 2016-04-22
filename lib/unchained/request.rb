require 'rest-client'

module Unchained
  module Request

    def get(url, params={})
      RestClient.get(url, build_params(params)) do |resp, req, res, &block|
        case resp.code
        when 200
          JSON.parse(resp)
        when 404
          raise Unchained::NotFound.new(res.message)
        else
          resp.return!(req, res, &block)
        end
      end
    end

    def get_resource(url, resource_class, params={})
      resource_class.from_json(get(url, params))
    end

    def get_resources(url, resource_class, params={})
      get(url, params).map do |result|
        resource_class.from_json(result)
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
