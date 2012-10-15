class ChatController < ApplicationController
  before_filter :authenticate_user

  def main
    @friend_list = @current_user.user_friend_list
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

  def remove_friend
    friend = User.find_by_username(params[:username])
    respond_to do |format|
      if friend
        f_data = @current_user.friend_lists.find_by_friend_id(friend.id)
        if f_data
          f_data.destroy
          format.html { redirect_to chat_main_path, :notice => "Removed #{friend.username} from your friend list"}
        else
          format.html { redirect_to chat_main_path, :notice => "You don't have any friend with username #{friend.username}"}
        end
      else
         format.html { redirect_to chat_main_path, :notice => "Invalid username"}
      end
    end
  end
end
