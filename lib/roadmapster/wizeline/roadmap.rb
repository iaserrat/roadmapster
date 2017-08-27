require 'json'

module Roadmapster
  module Wizeline
    class Roadmap
      include Roadmapster::Wizeline::BaseApi

      def initialize(token:, organization:)
        @api_token = token
        @organization = organization
        @organization_domain = organization[:domain]
      end

      def all
        get('roadmaps', organization_domain: @organization_domain)
      end

      def find(id)
        get("roadmaps/#{id}", organization_domain: @organization_domain)
      end
    end
  end
end
