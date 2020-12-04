class UsersController < ApplicationController

    get '/users/new' do
        redirect_if_logged_in
        erb :"users/new"
    end

    post '/signup' do
        params.each do |label, input|
            if input.empty?
            #   flash[:new_user_error] = "Please enter a value for #{label}"
              redirect to '/users/new'
            end
          end

        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        redirect to "/bows"
    end

    get '/users/login' do
        redirect_if_logged_in
        erb :"users/login"
    end

end