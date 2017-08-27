require 'rest-client'
require 'json'

module Roadmapster
  module Wizeline
    module BaseApi

      BASE_ENDPOINT = 'https://platform.wizelineroadmap.com/api/'

      def get(resource)
        JSON.parse(
          RestClient.get(
            "#{BASE_ENDPOINT}#{resource}",
            headers
          ).body,
          symbolize_names: true
        )
      end

      private

      def headers
        { authorization: "Bearer #{@api_token}", }
      end
    end
  end
end
