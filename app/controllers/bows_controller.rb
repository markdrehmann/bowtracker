class BowsController < ApplicationController

    get '/bows' do
        redirect_if_not_logged_in
        @bows = Bow.all
        erb :'/bows/index'
    end

    get '/bows/new' do
        redirect_if_not_logged_in
        @makers = Maker.all
        erb :'/bows/new'
    end

    post '/bows' do
        bow = Bow.new(user_id: "#{current_user.id}")
        params[:bow].each do |key, value|
            bow.send("#{key}=", value) if value != ""
        end
        
        if bow.maker_id == nil && params[:maker][:name] != ""
            bow.maker = Maker.new(name: params[:maker][:name])
        end
        
        if params[:bow].each { |key, value| value == "" } && params[:maker][:name] == ""
            flash[:error] = "You must fill in the form to create a bow!"
            redirect '/bows/new'            
        else
            bow.save
            flash[:message] = "New Bow Created!"
            redirect "/bows/#{bow.id}"
        end
    end

    get '/bows/:id' do
        redirect_if_not_logged_in
        @bow = Bow.find(params[:id])
        erb :'/bows/show'
    end
end