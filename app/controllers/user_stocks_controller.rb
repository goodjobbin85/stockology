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
        stock = Stock.find(params[:id])
        @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        @user_stock.destroy
        flash[:notice] = "Stock successfully removed from portfolio"
        redirect_to user_path(current_user)
    end
end
