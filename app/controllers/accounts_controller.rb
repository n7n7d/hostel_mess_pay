class AccountsController < ApplicationController

  def show
    @account=current_user.resident.account
  end

end
