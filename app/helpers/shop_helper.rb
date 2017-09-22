module ShopHelper
  def current_user_shop_list
    @current_user_shop_list ||= current_user.shops
  end

  def current_shop
    current_shop_id = cookies["current_shop_user_#{current_user.id}"].to_i
    @current_shop ||= if @current_user_shop_list
      @current_user_shop_list.find {|shop| shop.id == current_shop_id} || @current_user_shop_list.first
    else
      current_user.shops.find_by(id: current_shop_id) || current_user.shops.first
    end
  end
end
