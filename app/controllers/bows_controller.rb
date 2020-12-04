class BowsController < ApplicationController

    get '/bows' do
        @bows = Bow.all
        erb :'/bows/index'
    end

end