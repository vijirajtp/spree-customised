class AccountsController < ApplicationController

	def new
		@account = Account.new	
	end

	def create
		@account = Account.create(params[:account])
		if @account.persisted?
			respond_with(@account, :default_template => :show)
		else
			render :new
		end
	end
end
