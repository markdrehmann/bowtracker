class UsersController < ApplicationController

    get '/users/new' do
        redirect_if_logged_in
        erb :"users/new"
    end

    post '/signup' do
        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            flash[:error] = "#{user.errors.full_messages.to_sentence}"
            redirect to '/users/new'
        end
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
            flash[:error] = "Invalid entry, try again!"
            redirect '/users/login'
         end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        if params[:id].to_i == current_user.id
            erb :"/users/show"
        else
            flash[:error] = "You can't view someone else's page!"
            redirect to "/users/#{current_user.id}"
        end
    end
end