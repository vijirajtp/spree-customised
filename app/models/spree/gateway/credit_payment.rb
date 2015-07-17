module Spree
	class Gateway::CreditPayment < Gateway
		def payment_profiles_supported?
      true
    end

    def purchase
      Class.new do
          def success?; true; end
          def authorization; nil; end
        end.new
    end
	end
end