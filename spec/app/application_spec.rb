require 'spec_helper'

describe Shawtie::Application do
  context 'GET /:hash' do
    let(:link) { FactoryGirl.build(:link) }

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
end
