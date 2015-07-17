Spree::User.class_eval do
  
  ## Relationships
  belongs_to :account

  ## Methods
  def is_part_of_account?
  	!self.account.blank?
  end

  def is_credit_approved?
		self.is_part_of_account? and self.account.credit_approved
  end

  def credit_limit
  	self.is_credit_approved? ? self.account.credit_limit.to_f : 0
  end

end