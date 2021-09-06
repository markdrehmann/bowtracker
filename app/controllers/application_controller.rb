require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  
  configure do
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect_if_logged_in
    erb :index
  end

  get "/not-logged-in" do
    erb :not_logged_in
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

  get '/fun' do
    if logged_in?
      erb :for_fun
    else
      redirect_if_not_logged_in
    end
  end

  get '/secret' do
    erb :inigo
  end

  helpers do
    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end

    def authorized_user?(bow)
      bow.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/not-logged-in"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/bows"
      end
    end
  end

end
