class FriendRequestsController < ApplicationController
  def create
    @user = User.find(params[:format])
    request = @user.pending_requests_receiver.build
    request.user_id = current_user.id
    if request.save
      redirect_to users_path, notice: "Friend request sent!"
    else
      redirect_to @user, notice: "Something went wrong. Error #{request.errors.messages}"
    end
  end

  def update
    @request = FriendRequest.find(params[:id])
    @request.confirmed = true
    if @request.save
      redirect_to user_path(current_user.id), notice: "Friend request accepted!"
    else 
      redirect_to user_path(@request.user_id), notice: "Something went wrong!"
    end
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    @request.destroy
    redirect_to users_path
  end
end
