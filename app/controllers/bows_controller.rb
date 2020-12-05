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

        # direct to the created bows show page
    end

    get '/bows/:id' do
        redirect_if_not_logged_in
        @bow = Bow.find(params[:id])
        erb :'/bows/show'
    end
end