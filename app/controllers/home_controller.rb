class HomeController < ApplicationController
skip_before_filter :verify_authenticity_token

def homeindex
  @watch_user_name = current_user.name + " 's Games List "
  gon.watch.username = @watch_user_name
end

end
