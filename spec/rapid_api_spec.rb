require 'spec_helper'

describe RapidAPI do
  it 'has a version number' do
    expect(RapidAPI::VERSION).not_to be nil
  end

  it 'configures credentials' do
    RapidAPI.config(project: 'project', api_key: 'api_key')

    expect(RapidAPI::Config.project).to eq('project')
    expect(RapidAPI::Config.api_key).to eq('api_key')
  end

  it 'builds URI' do
    uri = RapidAPI.build_uri('p','k')

    expect(uri.host).to eq('rapidapi.io')
    expect(uri.path.include?('connect/p/k'))
  end
end
