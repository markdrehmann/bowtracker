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
        redirect to "/users/#{user.id}"
    end

    get '/users/login' do
        redirect_if_logged_in
        erb :"users/login"
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
         else
            erb :'/users/login'
         end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = current_user # code something so users can only see their own page
        erb :"/users/show"
    end
end