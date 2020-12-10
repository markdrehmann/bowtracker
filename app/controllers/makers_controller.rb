class MakersController < ApplicationController

    get '/makers' do
        redirect_if_not_logged_in
        makers = Maker.all - Maker.find(3,4,5)
        @makers_sorted = makers.sort_by {|m| m.name.split(" ").last}
        erb :'/makers/index'
    end

    get '/makers/:id' do
        redirect_if_not_logged_in
        @maker = Maker.find(params[:id])
        erb :'/makers/show'
    end

    get '/makers/:id/edit' do
        @maker = Maker.find(params[:id])
        if current_user == User.find(1)
            erb :'/makers/edit'
        else
            flash[:error] = "Not authorized to edit this!"
            redirect to '/makers'
        end
    end

    patch '/makers/:id' do
        maker = Maker.find(params[:id])
        
        redirect to "/makers/#{maker.id}"
    end

    delete '/makers/:id' do
        Maker.destroy(params[:id])
        flash[:message] = "Maker has been deleted from memory."
        redirect to "/makers"
    end
end