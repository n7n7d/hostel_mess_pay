class MicropostsController < ApplicationController

    def show
      @user = current_user
      @microposts = @user.microposts
    end
end
