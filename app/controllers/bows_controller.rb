class BowsController < ApplicationController

    get '/bows' do
        erb :'/bows/index'
    end

end