require "spec_helper"

describe Link do
  context "callbacks" do
    it "sets hash after create" do
      allow(SecureRandom).to receive(:urlsafe_base64).and_return("hash")
      link = FactoryGirl.build(:link)

      expect(link.hash).to eq "hash"
    end

    it "persists hash after create" do
      link = FactoryGirl.build(:link)

      expect(Link.find(hash: link.hash)).not_to be_empty
    end
  end

  context "indexes" do
    it "has an index on url" do
      expect {
        Link.find(url: "whatever")
      }.not_to raise_error
    end

    it "has an index on hash" do
      expect {
        Link.find(hash: "whatever")
      }.not_to raise_error
    end
  end
end
