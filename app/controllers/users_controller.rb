class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @rooms = current_user.rooms.page(params[:page]).per(5)
  end  
end
