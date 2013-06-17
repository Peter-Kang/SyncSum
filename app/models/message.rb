class Message < ActiveRecord::Base
	belongs_to :recipient, class_name: "User", foreign_key: "recipientID"
	belongs_to :sender, class_name: "User", foreign_key: "senderID"
end
