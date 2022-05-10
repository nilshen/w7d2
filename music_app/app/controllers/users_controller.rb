class UsersController < ApplicationController

    def index
        @user = User.all
        render :index
    end

    def show
        @user = User.find(
        params[:id]
        )
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Object successfully created"
          log_in_user!(@user)
          redirect_to user_url(@user)
        else
          flash[:error] = "Something went wrong"
          render :new
        end
    end
    

    def edit
        @user = User.find(
        params[:id]
        )
        render :edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash.now[:success] = "Object was successfully updated"
          render :show
        else
          flash.now[:error] = "Something went wrong"
          render :edit
        end
    end
    
    def user_params
        params.require(:user).permit(:email, :password)
    end
    
    
end
