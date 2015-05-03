class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :messages, :class_name => "User"
end
