require 'json'
require 'date'

module Roadmapster
  module Wizeline
    class Roadmap
      include Roadmapster::Wizeline::BaseApi

      DEFAULT_TYPE_ID = '_0668tj9T5q5MTuqLxlsAA'

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

      def create_unit(roadmap_id:, name:, **options)
        item_payload = {
          id: '-:PENDING:-',
          parent_id: options[:parent_id] || nil,
          position: options[:position] || 1,
          unit: {
            id: '-:PENDING:-',
            name: name,
            description: options[:description] || '',
            start_date: options[:start_date] || DateTime.now.strftime("%Y-%m-%d"),
            end_date: options[:end_date] || (DateTime.now + 7).strftime("%Y-%m-%d"),
            owner_id: options[:owner_id] || nil,
            type_id: DEFAULT_TYPE_ID,
            type: options[:type] || 'Release',
            risk_level: options[:risk_level] || 'MEDIUM_RISK',
            color: options[:color] || nil
          }
        }
        post("roadmaps/#{roadmap_id}/items", item_payload, organization_domain: @organization_domain)
      end
    end
  end
end
