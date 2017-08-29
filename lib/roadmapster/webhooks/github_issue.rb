module Roadmapster
  module Webhooks
    class GithubIssue
      HINT_KEYWORD = '[ROADMAP]'

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
        @payload[:issue][:title].include?(HINT_KEYWORD)
      end

      def action
        @payload[:action]
      end

      def clean_title
        @payload[:issue][:title].gsub(HINT_KEYWORD, '')
      end

      def title
        @payload[:issue][:title]
      end

      def number
        @payload[:issue][:number]
      end
    end
  end
end
