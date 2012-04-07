require 'spec_helper'

describe Link do
  context 'validations' do
    it 'requires url to be present' do
      link = Link.create(url: nil)
      link.errors.assoc(:url)[1].should == :not_present
    end

    it 'requires hash to be present' do
      link = Link.create(hash: nil)
      link.errors.assoc(:hash)[1].should == :not_present
    end
  end
end
