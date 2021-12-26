class QuotesController < ApplicationController
    def delete 
        quote = Quote.find(params[:id])
        quote.delete
        render json: {:status => 200, :message => {:note => "Quote Successfully Deleted!", :quote => quote}}
    end 

    def create 
        show = Show.find(params[:id])
        case show.id
        when 1
            quote = Faker::TvShows::SouthPark.quotes
        when 2
            quote = Faker::TvShows::Community.quotes
        when 3
            quote = Faker::TvShows::HeyArnold.quotes
        when 4 
            quote = Faker::TvShows::GameOfThrones.quotes
        end 
        created = Quote.create(quote: quote, show_id: show.id)
        render json: {:status => 200, :message => {:note => "Quote Successfully Created!", :quote => created}}
    end 
end
