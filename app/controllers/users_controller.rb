class UsersController < ApplicationController

    get '/users/new' do
        erb :"users/new"
    end

    get '/users/login' do
        erb :"users/login"
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/'
        else
          redirect to '/'
        end
    end

end