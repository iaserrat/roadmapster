require 'spec_helper'
require 'vcr'

RSpec.describe Roadmapster::Wizeline::Roadmap do

  before :each do
    @api_token = ENV['WIZELINE_API_TOKEN']
    @organization = Roadmapster::Wizeline::Organization.new(token: @api_token).find('M_d4XCCpQ32XQosuGZGAiw')
    @roadmaps = Roadmapster::Wizeline::Roadmap.new(token: @api_token, organization: @organization)
  end

  vcr_options = { cassette_name: 'wizeline/get_roadmaps' }
  it 'lists all roadmaps', vcr: vcr_options do
    roadmaps = @roadmaps.all
    expect(roadmaps[:data]).to be_an(Array)
    expect(roadmaps[:data].count).to eq(1)
  end

  vcr_options = { cassette_name: 'wizeline/get_roadmap' }
  it 'finds a roadmap by id', vcr: vcr_options do
    roadmap = @roadmaps.find('QfU11YeHQ3uhpdwzypMmRw')
    expect(roadmap).to be_an(Hash)
    expect(roadmap[:name]).to eq('Untitled')
    expect(roadmap[:organization_id]).to eq(@organization[:id])
  end
end
