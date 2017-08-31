require 'rest-client'

module Roadmapster
  module Webhooks
    class GithubIssue
      HINT_REGEX = /\[ROADMAP\/.*\/.*\]/

      def initialize(webhook_payload)
        @payload = webhook_payload
      end

      def should_track?
        if should_check? && contains_tracker?
          return true
        end
        return false
      end

      def should_check?
        action == 'opened' || action == 'edited'
      end

      def contains_tracker?
        @tracker ||= HINT_REGEX.match(description)[0]
        !@tracker.nil?
      end

      def tracker
        @tracker
      end

      def action
        @payload[:action]
      end

      def title
        @payload[:issue][:title]
      end

      def number
        @payload[:issue][:number]
      end

      def description
        @payload[:issue][:body]
      end
    end
  end
end
