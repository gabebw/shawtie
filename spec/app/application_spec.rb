require "spec_helper"

describe Shawtie::Application do
  context "GET /:hash" do
    let!(:link) { FactoryGirl.build(:link) }

    before do
      get "/#{link.hash}"
    end

    it "is a redirect" do
      expect(last_response).to be_redirect
    end

    it "redirects to the URL" do
      expect(last_response.location).to eq link.url
    end
  end

  context "POST /" do
    let(:url) { "http://ruby-lang.com" }

    before do
      post "/", url: url
    end

    it "is successful" do
      expect(last_response).to be_successful
    end

    it "creates a link with the given url" do
      expect(Link.find(url: url).size).to eq 1
    end
  end
end
