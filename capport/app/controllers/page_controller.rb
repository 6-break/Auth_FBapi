class PageController < ApplicationController
  before_filter :authenticate_user!
  #def check
  #end

  #def result
  #end
  def result
   if session[:previous_url] != check_path && session[:previous_url] != result_path
   redirect_to check_path
   end
  end
  #likesの処理
  def check
    client = current_user.graph
    events = client.get_connections("me", "events")
    events.each do |event|
     if event["id"] == "1419229731651584"
      redirect_to result_path
     end

    #likes = client.get_connections("me", "likes")
    #likes.each do |like|
    # if like["id"] =="1056058057778572"
    #  redirect_to result_path
    #  end
    end
   end

end
