require 'spec_helper'
require_relative '../../jobs/create_wizeline_issue_job'

RSpec.describe CreateWizelineIssueJob do
  describe '#perform' do
    before do
      expect(worker).to receive(:issue_from_payload).with(payload).and_return(issue)
    end

    let(:payload) do
      { foo: 'bar' }
    end

    let(:worker){ CreateWizelineIssueJob.allocate }

    context 'when the issue should be tracked' do
      let(:issue){ instance_double(Roadmapster::Webhooks::GithubIssue, should_track?: true) }

      it 'creates and returns the issue' do
        expect(worker).to receive(:create_wizeline_issue).with(issue)
        worker.perform(payload)
      end
    end

    context 'when the issue should not be tracked' do
      let(:issue){ instance_double(Roadmapster::Webhooks::GithubIssue, should_track?: false) }

      it 'returns nil without creating an issue' do
        expect(worker).not_to receive(:create_wizeline_issue)
        worker.perform(payload)
      end
    end
  end
end
