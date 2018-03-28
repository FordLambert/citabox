class PagesController < ApplicationController

  before_action :get_quote, only: [:update, :edit, :destroy]

  def home
  	if session[:user_id]
  	  @current_user = User.find(session[:user_id])
  	end
  	@quotes = Quote.all
  end

  def create
  end

  def show
  end

  def update
    @quote.content = params[:content]
    @quote.save
    redirect_to "/pages/home"
  end

  def edit
  end

  def destroy
    @quote.destroy
  	redirect_to "/pages/home"
  end

  def add_quote
  	quote = Quote.new
  	quote.content = params[:content]
  	quote.user_id = session[:user_id]
  	quote.save

  	redirect_to "/pages/home"
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

  private

  def get_quote
  	@quote = Quote.find(params[:id])
  end

end
