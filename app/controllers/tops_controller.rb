class TopsController < ApplicationController
  def index
    if user_signed_in?
      @shops = Shop.all
      rooms = current_user.rooms
      @shop_ids = []
      rooms.each do |r|
        @shop_ids << r.shop_id
      end
    
    elsif shop_signed_in?
      @users = User.all
      rooms = current_shop.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
