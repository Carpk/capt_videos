require 'rails_helper'

describe Tag do

  let(:tag) {Tag.last}

  it "should return an array" do
    tag = 'Epic'
    expect(Tag.parse_tags(tag).class).to eq(Array)
  end

  it "should parse a single tag" do
    tag = 'Epic'
    expect(Tag.parse_tags(tag).first.class).to eq(Tag)
  end

  it "should parse multiple tags" do
    tags = 'Epic, GPS'
    expect(Tag.parse_tags(tags).count).to eq(2)
  end  
end
