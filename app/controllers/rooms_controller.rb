class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @rooms = Room.all
  end  

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    if @room.valid? && @room.save 
      redirect_to root_path
    else
      render :new
    end  
  end  

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path
    else
      render :edit
    end 
  end 

  def destroy
    @room = Room.find(params[:id])
    if current_user.id = @room.user_id
      @room.destroy
      redirect_to root_path
    end 
  end  

  private
  def room_params
    params.require(:room).permit(:title,:text,:category_id,:price,:date_time,:deadline_date_time,:place,:video,:image).merge(user_id: current_user.id)
  end 

end