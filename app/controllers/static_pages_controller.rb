class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_activities = Activity.feed_all(current_user.following_ids,
        current_user).recent.paginate page: params[:page],
        per_page: Settings.paginate_per_page
    end
  end

  def help
  end
end
