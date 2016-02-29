require 'rails_helper'

describe Tag do

  let(:tag) {Tag.last}

  it "should parse a single tag" do
    tags = 'Epic'
    expect(Tag.parse_tags(tags).first.class).to eq(Tag)
  end
  
end
