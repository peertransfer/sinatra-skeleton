# coding: utf-8
require 'spec_helper'

describe 'Server' do
  it 'Should redirect to default city' do
    get '/'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.url).to include('/Valencia')
  end

  it 'Get should be 200' do
    get '/Valencia'
    expect(last_response).to be_ok
  end

  it 'Should contain Valencia in the body' do
    get '/Valencia'
    expect(last_response.body).to include('Valencia')
  end

  it 'Should get the information in international unit system' do
    get '/Valencia'
    expect(last_response.body).to include('°C')
  end

  it 'Should get the information in international unit system' do
    get '/Valencia?metric_system=si'
    expect(last_response.body).to include('°C')
  end

  it 'Should get the information in imperial unit system' do
    get '/Valencia?metric_system=us'
    expect(last_response.body).to include('°F')
  end
end
