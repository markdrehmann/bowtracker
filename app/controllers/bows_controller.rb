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
        binding.pry
        # have to deal with Add New Maker input
        bow.save
        redirect "/bows/#{bow.id}"
    end

    get '/bows/:id' do
        redirect_if_not_logged_in
        @bow = Bow.find(params[:id])
        erb :'/bows/show'
    end
end