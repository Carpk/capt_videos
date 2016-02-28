require 'rails_helper'

describe Tag do

  let(:tag) {Tag.last}

  it "should return a sample set" do
    expect(tag.sample_set).to eq("something")
  end
  
end
