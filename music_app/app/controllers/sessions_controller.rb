class SessionsController < ApplicationController
    
    def new
        # @session = Session.new #!!!does not need this!!!
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if @user
            log_in_user!(@user)
            # @user.reset_session_token #!!!already reset through login
            redirect_to user_url(@user)
        else
            render :new
        end
    end
     
    def destroy
        logout!
        redirect_to new_session_url
    end



    
end
