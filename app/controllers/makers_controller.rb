class MakersController < ApplicationController

    get '/makers' do
        redirect_if_not_logged_in
        @makers = Maker.all
        erb :'/makers/index'
    end

    get '/makers/:id' do
        redirect_if_not_logged_in
        @maker = Maker.find(params[:id]) # NOT SURE IF THIS IS CORRECT PARAMS
        erb :'/makers/show'
    end

end