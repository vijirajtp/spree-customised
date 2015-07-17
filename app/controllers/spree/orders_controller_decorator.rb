Spree::OrdersController.class_eval do

	def update
		unless @order.user.is_part_of_account?
			flash[:error] = "Please select a different payment method."
			redirect_to cart_path
			return
		end

		unless @order.credit_limit_exceeds
			if @order.contents.update_cart(order_params)
				respond_with(@order) do |format|
          format.html do
            if params.has_key?(:checkout)
              @order.next if @order.cart?
              redirect_to checkout_state_path(@order.checkout_steps.first)
            else
              redirect_to cart_path
            end
          end
        end
			else
				redirect_to cart_path
			end
		else
			flash[:error] = "You dont have enough credits to checkout this order."
			redirect_to cart_path
		end
		
	end
end