class PagesController < ApplicationController

  before_action :get_quote, only: [:update, :edit, :destroy]
  before_action :get_current_user, only: [:home, :edit, :create]

  def home
  	@quotes = Quote.all
  end

  def create
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

  private

  def get_quote
  	@quote = Quote.find(params[:id])
  end

  def get_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end
