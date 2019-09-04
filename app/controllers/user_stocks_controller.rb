class UserStocksController < ApplicationController
    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.find_stock(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:success] = "#{@user_stock.stock.ticker} successfully added to your portfolio!"
        redirect_to user_path(current_user)
    end
    
    def destroy
    end
end
