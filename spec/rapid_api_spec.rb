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

  it 'responds' do
    RapidAPI.config(
      project: 'unc-test',
      api_key: '17a8d35d-a839-480d-8457-f8aa354ecbbd'
    )
    response = RapidAPI.call('HackerNews', 'getItem', { 'itemId': '13126633'})
    expect(response['outcome']).to eq('success')
  end
end
