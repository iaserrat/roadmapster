# frozen_string_literal: true

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

      def by_name(name)
        all[:data].select { |o| o[:name] == name }.first
      end
    end
  end
end
