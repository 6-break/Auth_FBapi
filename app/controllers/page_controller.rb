#require 'pry'
class PageController < ApplicationController
  before_filter :authenticate_user!

  def result
   #bindings.pry
   if session[:previous_url] != check_path && session[:previous_url] != result_path
   redirect_to check_path
   end
  end

  #lfriendsの処理
  def check
    client = current_user.graph
    #friends
    friends = client.get_connections("me", "friends")

    friends.each do |friend|
    #binding.pry
    #文字列　数字に変換 to_iメソッド
     if friend["id"].to_i == Rails.application.secrets.admin_fb_id
     redirect_to page_result_path
    end

    #events
    #events = client.get_connections("me", "events")
    #events.each do |event|
    # if event["id"] == "142016072834826"
       #1419229731651584
    #  redirect_to page_result_path
    # end

    #いいね数チェックのcase
    #likes = client.get_connections("me", "likes")
    #likes.each do |like|
    # if like["id"] =="1056058057778572"
    #  redirect_to result_path
    #  end
 

    end

   end

end
