class MatchingsController < ApplicationController
  def index
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    search
    friend_list
    render 'matchings/index'
  end

  def search
    unless params[:search].nil?
      @searched_user = User.find_by(username: params[:search])
      flash.now[:alart_user] = 'User not found' if @searched_user.nil?
    end
  end

  def friend_list
    unless @current_user.nil?
      friend_relations = Relationship.find_by(friend1_id: @current_user.id)
      @friends = User.where('id = ?', friend_relations[:friend2_id]) unless friend_relations.nil?
    end
  end
end
