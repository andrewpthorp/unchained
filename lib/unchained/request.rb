require 'rest-client'

module Unchained
  module Request

    # Use RestClient to actually make the request to the API. If the response
    # is a 200 (success), we will parse the response as JSON and return it. If
    # the response is a known error (i.e. a 404), we will raise a custom
    # Unchained error (found in error.rb). If the response is an unkonwn error,
    # we will return it exactly as we found it.
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

    # If an API endpoint returns a single resource, not an Array of resources,
    # we want to use this.
    #
    # Returns an instance of `resource_class`.
    def get_resource(url, resource_class, params={})
      resource_class.from_hash(get(url, params), client: self)
    end

    # If an API endpoint returns an Array of resources, we want to use this.
    #
    # Returns an array of `resource_classes`.
    def get_resources(url, resource_class, params={})
      get(url, params).map do |result|
        resource_class.from_hash(result, client: self)
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
