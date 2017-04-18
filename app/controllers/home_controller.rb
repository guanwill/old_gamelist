class HomeController < ApplicationController
skip_before_filter :verify_authenticity_token

def homeindex
  if current_user.present?
    @watch_user_name = current_user.name + " 's Games List "
    gon.watch.username = @watch_user_name
  end

  @currentUser = current_user

  @GB_GAMES_API_URL = ENV['GB_GAMES_API_URL']
  @GB_SEARCH_API_URL = ENV['GB_SEARCH_API_URL']
end

end
