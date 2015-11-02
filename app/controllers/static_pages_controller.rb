class StaticPagesController < ApplicationController
  def home
    @feed_activities = current_user.feed.recent.paginate page: params[:page],
      per_page: Settings.paginate_per_page if logged_in?
  end

  def help
  end
end
