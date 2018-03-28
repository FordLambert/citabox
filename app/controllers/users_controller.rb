class UsersController < ApplicationController
    before_action :get_current_user

    def show
        @user = User.find(params[:id])
    end

    def create
    end

    def login
        @current_user = User.where(username: params[:username], password: params[:password]).first
        if @current_user
            session[:user_id] = @current_user.id
            flash[:info] = "Content de vous voir #{@current_user.username} !"
            redirect_to "/pages/home"
        else
            flash[:info] = "Erreur de connection mon brave."
            redirect_to "/pages/home"
        end
    end

    def disconnect
        session[:user_id] = nil
        redirect_to "/pages/home"
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