class MakersController < ApplicationController

    get '/makers' do
        redirect_if_not_logged_in
        makers = Maker.all - Maker.find(3,4,5)
        @makers_sorted = makers.sort_by {|m| m.name.split(" ").last}
        erb :'/makers/index'
    end

    get '/makers/:id' do
        redirect_if_not_logged_in
        @maker = Maker.find(params[:id]) # NOT SURE IF THIS IS CORRECT PARAMS
        erb :'/makers/show'
    end

end