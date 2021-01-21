class StocksController < ApplicationController

    def search 
        #need to fix flash alerts -- only appearing after redirect 
        if params[:stock].present?
            @stock = Stock.find_stock(params[:stock]) 
            if @stock 
                respond_to do |format| 
                    format.js { render partial: 'users/stock_result' } 
                    flash[:success] = "#{@stock.name} found!"
                end  
            else 
                   flash[:danger] = "Please enter valid ticker symbol" 
                   redirect_to portfolio_path
            end  
        else 
            flash[:alert] = "Stock name cannot be blank!" 
            redirect_to portfolio_path
        end 
    end
end
