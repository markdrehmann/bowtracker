class BowsController < ApplicationController

    get '/bows' do
        redirect_if_not_logged_in
        bows = Bow.all
        @bows_sorted = bows.sort_by {|b| b.maker.name}
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
        
        if bow.save
            flash[:message] = "New Bow Created!"
            redirect "/bows/#{bow.id}"       
        else
            flash[:error] = "Bows must have an instrument!" # ideally, I want bows to have an instrument and a maker
            redirect '/bows/new' 
        end
    end

    get '/bows/:id' do
        redirect_if_not_logged_in
        @bow = Bow.find(params[:id])
        erb :'/bows/show'
    end

    get '/bows/:id/edit' do
        @bow = Bow.find(params[:id])
        @makers = Maker.all
        if authorized_user?(@bow)
            erb :'/bows/edit'
        else
            flash[:error] = "You can't edit someone else's bow!"
            redirect to '/bows'
        end
    end
end