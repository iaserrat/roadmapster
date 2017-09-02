# frozen_string_literal: true

require 'date'

module Roadmapster
  module Wizeline
    class Roadmap
      include Roadmapster::Wizeline::BaseApi

      DEFAULT_TYPE_ID = 'bwhWdvctSnerDNEAnrRQMA'

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

      def by_name(name)
        all[:data].select { |r| r[:name] == name }.first
      end

      def create_unit(roadmap_id:, name:, description:, **options)
        item_payload = {
          id: '-:PENDING:-',
          parent_id: options[:parent_id],
          position: options[:position] || 1,
          unit: unit_options(name, description, options)
        }

        post("roadmaps/#{roadmap_id}/items", item_payload, organization_domain: @organization_domain)
      end

      private

      def unit_options(name, description, options)
        default_unit_options.merge({
          name: name,
          description: description,
          start_date: options[:start_date],
          end_date: options[:end_date],
          owner_id: options[:owner_id],
          type: options[:type],
          risk_level: options[:risk_level],
          color: options[:color]
        }.compact)
      end

      def default_unit_options
        {
          id: '-:PENDING:-',
          description: '',
          start_date: DateTime.now.strftime('%Y-%m-%d'),
          end_date: (DateTime.now + 7).strftime('%Y-%m-%d'),
          type: 'Release',
          type_id: DEFAULT_TYPE_ID,
          risk_level: 'MEDIUM_RISK'
        }
      end
    end
  end
end
