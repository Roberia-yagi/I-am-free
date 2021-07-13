class MatchingsController < ApplicationController
  def index
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    search
    friend_list
    render "matchings/index"
  end

  def search
    unless params[:search].nil?
      @searched_user = User.find_by(username: params[:search])
      flash.now[:alart_user] = "User not found" if @searched_user.nil?
    end
  end

  def friend_list
    unless @current_user.nil?
      friends_list = Relationship.where(friend1_id: @current_user.id)
      array = []
      friends_list.each do |friend|
        array.append(friend[:friend2_id])
      end
      @friends = User.where("id IN (?)", array)
    end
  end
end
