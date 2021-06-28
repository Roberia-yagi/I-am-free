class RelationshipsController < ApplicationController
  def create
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @other_user ||= User.find_by(id: params[:user])
    if @current_user.add_friend(@other_user)
      flash.now[:notice] = 'successfully added'
    else
      flash.now[:alart_add] = 'not added'
    end
    render 'matchings/index'
  end

  def destroy
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @other_user ||= User.find_by(id: params[:user])
    if @current_user.remove_friend(@other_user)
      flash.now[:notice] = 'successfully deleted'
    else
      flash.now[:alart_add] = 'not deleted'
    end
    render 'matchings/index'
  end
end
