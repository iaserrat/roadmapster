require_relative '../http/helpers'

class CreateWizelineIssueJob
  include SuckerPunch::Job
  include Http::Helpers

  def perform(payload)
    issue = issue_from_payload(payload)
    return unless issue.should_track?
    create_wizeline_issue(issue)
  end
end
