class StocksController < ApplicationController

    def search
        if params[:stock].blank? #what is the diff between .blank? and .present?
            flash.now[:danger] = "Stock cannot be blank"
            render 'users/portfolio'
        else
            @stock = Stock.find_stock(params[:stock])
            flash.now[:danger] = "Please enter valid stock" unless @stock
            render "users/portfolio"
        end
        
    end
end
