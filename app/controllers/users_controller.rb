class UsersController < ApplicationController

    get '/users/new' do
        redirect_if_logged_in
        erb :"users/new"
    end

    get '/users/login' do
        redirect_if_logged_in
        erb :"users/login"
    end

end