Spree::Admin::PaymentsController.class_eval do

	def fire
    return unless event = params[:e] and @payment.payment_source

    # Because we have a transition method also called void, we do this to avoid conflicts.
    event = "void_transaction" if event == "void"
    if @payment.send("#{event}!")
    	
    	if @order.user.is_part_of_account?
    		if @payment.amount.to_f < @order.user.credit_limit
    			balance_credit = @order.user.credit_limit - @payment.amount.to_f
    			user_account = @order.user.account
    			user_account.credit_limit = balance_credit
    			user_account.save
    		end
    	end
      flash[:success] = Spree.t(:payment_updated)
    else
      flash[:error] = Spree.t(:cannot_perform_operation)
    end
  rescue Spree::Core::GatewayError => ge
    flash[:error] = "#{ge.message}"
  ensure
    redirect_to admin_order_payments_path(@order)
  end

end