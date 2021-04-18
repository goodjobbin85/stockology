module CartsHelper 
    private 

    def set_cart 
        if @cart 
            @cart = Cart.find(session[:cart_id]) 
        else 
            @cart = Cart.create 
            session[:cart_id] = @cart.id 
        end 
    end 
end
