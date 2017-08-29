require 'spec_helper'
require 'vcr'

RSpec.describe Roadmapster::Wizeline::Organization do

  before :each do
    @api_token = ENV['WIZELINE_API_TOKEN']
    @organizations = Roadmapster::Wizeline::Organization.new(token: @api_token)
  end

  vcr_options = { cassette_name: 'wizeline/get_organizations' }
  it 'lists all organizations for the current user', vcr: vcr_options do
    organizations = @organizations.all
    expect(organizations[:data]).to be_an(Array)
  end

  vcr_options = { cassette_name: 'wizeline/get_organization' }
  it 'finds an organization by id', vcr: vcr_options do
    organization = @organizations.find('M_d4XCCpQ32XQosuGZGAiw')
    expect(organization).to be_an(Hash)
  end

  vcr_options = { cassette_name: 'wizeline/get_organizations' }
  it 'gets organization by name', vcr: vcr_options do
    organization = @organizations.by_name('roadmapster')
    expect(organization).to be_an(Hash)
    expect(organization[:name]).to eq('roadmapster')
    expect(organization[:id]).to eq('M_d4XCCpQ32XQosuGZGAiw')
  end
end
