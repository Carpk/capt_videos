require 'rails_helper'

describe User do

  it "should remove dot charater from name" do
    expect(User.new(username: "foo.bar").check_name).to eq("foo_bar")
  end
end
