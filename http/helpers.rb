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

    def create_wizeline_issue(issue)
      api_token = get_token
      organization = Roadmapster::Wizeline::Organization.new(token: api_token).find('# TODO')
      roadmap = Roadmapster::Wizeline::Roadmap.new(token: api_token, organization: organization)
      roadmap.create_unit(roadmap_id: '# TODO', name: "Github ##{issue.number}:  #{issue.clean_title}")
    end
  end
end
