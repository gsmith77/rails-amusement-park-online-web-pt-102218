class UsersController < ApplicationController

    def show
        @user = User.find_by(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        if User.find_by(params[:id])
            @user = User.find_by(params[:id]) 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :'welcome/home'
        end

        #need DESTROY method to log out user, delete session[:user_id].delete :name
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
