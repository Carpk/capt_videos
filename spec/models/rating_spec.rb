require 'rails_helper'

describe 'Rating' do

  it "should list popular videos" do
    expect(Rating.popular_ratings.first.score).to eq(5)
  end

end
