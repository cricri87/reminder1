class FriendsController < ApplicationController
 before_action :set_friend,  only: [:show, :edit, :update, :destroy]
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def show
    days_left
    years_old
  end

  def create
    @friend = Friend.create(friend_params)
    @friend.user = current_user
    if @friend.save
      redirect_to friend_path(@friend.id)
    else
      render 'new'
    end


  end

   def edit
  end

  def update
    @friend.update(friend_params)
    if @friend.save
      redirect_to friend_path(@friend.id)
    else
      render 'edit'
    end
  end

  def destroy
    @friend.destroy
    redirect_to root_path
  end

  private

  def set_friend
     @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :nickname, :birthday)
  end

  def days_left
    @bday = Date.new(Date.today.year, @friend.birthday.month, @friend.birthday.day)
    @bday += 1.year if Date.today >= @bday
    @days = (@bday - Date.today).to_i
  end

  def years_old
    @age = Date.today.year - @friend.birthday.year
  end
end
