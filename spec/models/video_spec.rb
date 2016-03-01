require 'rails_helper'

describe Video do

  let(:video) {Video.first}

  it "should create a basic value" do
    expect(video.create_rating.score).to eq(3)
  end

  it "should return videos from same user" do
    first_id = video.user_collection.first.user_id
    expect(video.user_collection.last.user_id).to eq(first_id)
  end

  it "should return top rated videos" do
    expect(Video.top_rated.count).to eq(7)
  end

  it "should return an average score" do
    expect(video.avg_score.class).to eq(Fixnum)
  end

  it "should return a set amount of videos" do
    expect(Video.find(5).similar_videos.count).to eq(6)
  end

  it "should return videos of same tag" do
    set_of_videos = video.similar_videos
    last_tag = set_of_videos.last.tags.first
    expect(set_of_videos.first.tags.first).to eq(last_tag)
  end

  it "should return a smaller set of videos" do
    expect(video.sm_set.count).to eq(3)
  end
end
