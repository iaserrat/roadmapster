# frozen_string_literal: true

require 'rest-client'
require 'json'

module Roadmapster
  module Wizeline
    module BaseApi
      BASE_ENDPOINT = 'https://<subdomain>.wizelineroadmap.com/api/'

      def get(resource, **options)
        @resource_options = options
        JSON.parse(
          RestClient.get(
            "#{base_endpoint(options)}#{resource}",
            headers
          ).body,
          symbolize_names: true
        )
      end

      def post(resource, payload, **options)
        @resource_options = options
        response = RestClient.post(
          "#{base_endpoint(options)}#{resource}",
          payload.to_json,
          headers
        )
        JSON.parse(response.body, symbolize_names: true)
      end

      private

      def headers
        { authorization: "Bearer #{@api_token}", content_type: :json }
      end

      def base_endpoint(options)
        if options.empty?
          BASE_ENDPOINT.sub('<subdomain>', 'platform')
        else
          BASE_ENDPOINT.sub('<subdomain>', options[:organization_domain])
        end
      end
    end
  end
end
