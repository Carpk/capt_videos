require 'rails_helper'

describe Video do

  let(:video) {Video.first}

  it "should do something" do
    expect(video.create_rating.score).to eq(3)
  end

  it "should return 6 samples" do
    expect(video.user_collection.count).to eq(6)
  end

  it "should return top rated videos" do
    expect(Video.top_rated.count).to eq(7)
  end

  it "should return an average score" do
    expect(video.avg_score).to eq(33)
  end

  it "should return similar tagged videos" do
    expect(video.similar_videos.count).to eq(4)
  end

  it "should return a smaller set of similar videos" do
    expect(video.sm_set.count).to eq(3)
  end
end
