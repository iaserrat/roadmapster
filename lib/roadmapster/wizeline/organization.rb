require 'json'

module Roadmapster
  module Wizeline
    class Organization
      include Roadmapster::Wizeline::BaseApi

      def initialize(token:)
        @api_token = token
      end

      def all
        get('organizations')
      end

      def find(id)
        get("organizations/#{id}")
      end
    end
  end
end
