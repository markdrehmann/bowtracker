class BowsController < ApplicationController

    get '/bows' do
        @bows = Bow.all
        erb :'/bows/index'
    end

    get '/bows/:id' do
        
        erb :'/bows/show'
    end
end