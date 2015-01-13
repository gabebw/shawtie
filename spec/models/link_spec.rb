require 'spec_helper'

describe Link do
  context 'callbacks' do
    it 'sets hash after create' do
      link = FactoryGirl.build(:link)
      link.hash.should == 'b'
    end

    it 'persists hash after create' do
      link = FactoryGirl.build(:link)
      Link.find(hash: link.hash).should_not be_empty
    end
  end

  context 'indexes' do
    it 'has an index on url' do
      lambda do
        Link.find(url: 'whatever')
      end.should_not raise_error(Ohm::IndexNotFound)
    end

    it 'has an index on hash' do
      lambda do
        Link.find(hash: 'whatever')
      end.should_not raise_error(Ohm::IndexNotFound)
    end
  end
end
