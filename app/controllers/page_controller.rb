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

    end

   end

end
