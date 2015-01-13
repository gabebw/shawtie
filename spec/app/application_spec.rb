require 'spec_helper'

describe Shawtie::Application do
  context 'GET /:hash' do
    let!(:link) { FactoryGirl.build(:link) }

    before do
      get "/#{link.hash}"
    end

    it 'is a redirect' do
      last_response.should be_redirect
    end

    it 'redirects to the URL' do
      last_response.location.should == link.url
    end
  end

  context 'POST /' do
    let(:url) { 'http://ruby-lang.com' }

    before do
      post '/', url: url
    end

    it 'is successful' do
      last_response.should be_successful
    end

    it 'creates a link with the given url' do
      Link.find(url: url).size.should == 1
    end
  end
end
