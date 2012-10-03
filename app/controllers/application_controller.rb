class ApplicationController < ActionController::Base
  protect_from_forgery

#  before_filter :get_pre_urls
#  use redirect_to :back !
#  private
#
#  def get_pre_urls
#    session[:url] = request.referer
#  end

end
