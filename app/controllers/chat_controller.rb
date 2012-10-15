class ChatController < ApplicationController
  before_filter :authenticate_user

  def main

  end

  def add_friend
    friend = User.find_by_username(params[:username])
    respond_to do |format|
      if friend
        if @current_user.friend_lists.find_by_friend_id(friend.id)
          format.json { render :json => {:success => true, :status => "You added #{friend.username} already!"}}
        elsif friend.id == @current_user.id
          format.json { render :json => {:success => true, :status => "You cannot add yourself"}}
        else
          @current_user.friend_lists.create(:friend_id => friend.id)
          format.json { render :json => {:success => true, :friend => friend.username, :status => "Friend added"}}
        end
      else
        format.json { render :json => {:success => true, :status => "Friend not found"}}
      end
    end
  end
end
