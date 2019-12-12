class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if @room.user.id == current_user.id
      @shop = @room.shop
    else
      redirect_to "root_path"
    end
  elsif shop_signed_in?
    if @room.shop.id == current_user.id
      @user = @room.user
    else
      redirect_to "root_path"
    end

  else
    redirect_to "root_path"
  end
end

  def create
    if user_signed_in?
      @room = Room.new(room_shop_params)
      @room.user_id = current_user.id
    elsif shop_signed_in?
      @room = Room.new(room_user_params)
      @room.shop_id = current_shop.id
    else
      redirect_to "root_path"
    end

  if @room.save
    redirect_to action: "show", id: @room.id
  else
    redirect_to "root_path"
  end
end

  private
  def room_shop_params
    params.require(:room).permit(:shop_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end