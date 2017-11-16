# frozen_string_literal: true

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

  vcr_options = { cassette_name: 'wizeline/create_roadmap_units' }
  it 'creates a roadmap unit with default values', vcr: vcr_options do
    new_roadmap_unit = @roadmaps.create_unit(roadmap_id: 'QfU11YeHQ3uhpdwzypMmRw', name: 'TEST_UNIT_123')
    expect(new_roadmap_unit).to be_a(Hash)
  end

  vcr_options = { cassette_name: 'wizeline/get_roadmaps' }
  it 'gets a roadmap by name', vcr: vcr_options do
    roadmap = @roadmaps.by_name('Untitled')
    expect(roadmap).to be_a(Hash)
    expect(roadmap[:id]).to eq('QfU11YeHQ3uhpdwzypMmRw')
    expect(roadmap[:name]).to eq('Untitled')
  end
end
