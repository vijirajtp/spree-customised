class Account < ActiveRecord::Base

	has_many :users, class_name: "Spree::User", foreign_key: :account_id
	
end
