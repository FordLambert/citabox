class UsersController < ApplicationController
    before_action :get_current_user

    def show
        @user = User.find(params[:id])
    end

    def create
    end

    def add_user
        user = User.new
        user.username = params[:username]
        user.password = params[:password]
        user.save
        session[:user_id] = user.id
        redirect_to '/pages/home'
    end

    private

    def get_current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

end