class RelationshipsController < ApplicationController
  def create
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @other_user ||= User.find_by(id: params[:user])
    if @current_user.add_friend(@other_user)
      redirect_to root_path, notice: 'Successfully added'
    else
      redirect_to root_path, alart: 'not added'
    end
  end

  def destroy
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @other_user ||= User.find_by(id: params[:user])
    if @current_user.remove_friend(@other_user)
      redirect_to root_path, notice: 'Successfully deleted'
    else
      redirect_to root_path, alart: 'not deleted'
    end
  end
end
