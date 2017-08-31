require 'roadmapster'

module Http
  module Helpers
    def get_token
      Roadmapster::Wizeline::Auth.new(
        email: ENV['WIZELINE_EMAIL'],
        password: ENV['WIZELINE_PASSWORD']
      ).token
    end

    def issue_from_payload(payload)
      Roadmapster::Webhooks::GithubIssue.new(payload)
    end

    def tracker_parser(tracker)
      tokens = tracker.gsub!('[', '').gsub!(']', '').split('/')
      { organization_name: tokens[1], roadmap_name: tokens[2] }
    end

    def create_wizeline_issue(issue)
      api_token = get_token
      tracker_data = tracker_parser(issue.tracker)
      organization = Roadmapster::Wizeline::Organization.new(token: api_token).by_name(tracker_data[:organization_name])
      roadmap = Roadmapster::Wizeline::Roadmap.new(token: api_token, organization: organization)
      roadmap_id = roadmap.by_name(tracker_data[:roadmap_name])[:id]
      roadmap.create_unit(roadmap_id: roadmap_id, name: "Github ##{issue.number}:  #{issue.title}")
    end
  end
end
