class ConnectionsController < ApplicationController
  def create
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @other_user ||= User.find_by(id: params[:user])
    if Connection.already_queued?(@current_user, @other_user)
      redirect_to root_path, notice: "already queued in"
    else
      if Connection.in_queue(@current_user, @other_user)
        redirect_to root_path, notice: "In a queue"
      else
        redirect_to root_path, notice: "Matched!"
      end
    end
  end
end
