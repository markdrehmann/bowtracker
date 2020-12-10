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

    post '/bows' do ### I WANT TO MAKE IT SO A MAKER IS REQUIRED TO CREATE A BOW, along with instrument
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
            flash[:error] = "Bows must have an instrument!"
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
        if authorized_user?(@bow)
            erb :'/bows/edit'
        else
            flash[:error] = "You can't edit someone else's bow!"
            redirect to '/bows'
        end
    end

    patch '/bows/:id' do
        bow = Bow.find(params[:id])
        params[:bow].each do |key, value|
            bow.send("#{key}=", value) if value != ""
        end
        if bow.save
            flash[:message] = "Bow Updated!"
            redirect to "/bows/#{bow.id}"
        else
            flash[:error] = "#{bow.errors.full_messages.to_sentence}"
            redirect to "/users/#{current_user.id}"
        end
    end

    delete '/bows/:id' do
        Bow.destroy(params[:id])
        flash[:message] = "Bow has been deleted from memory."
        redirect to "/users/#{current_user.id}"
    end
end