Spree::Order.class_eval do
  
	## Methods
	def credit_limit_exceeds
		self.total.to_f > self.user.credit_limit if self.user and self.user.is_credit_approved?
	end
end