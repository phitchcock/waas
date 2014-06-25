class ActivitiesController < ApplicationController
  
  def index
    #@idea = Idea.friendly.find(params[:idea_id])
    @activities = PublicActivity::Activity.order("created_at desc")
  end

  def feed
    # All activity
    @activities = PublicActivity::Activity.order("created_at DESC").all
  end

  def yours
    # User activity
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "User", owner_id: current_user).paginate(page: params[:page], per_page: 10)
  end

  def ideafeed
    # Idea activity
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "Idea").all
  end

  def show
    @activity = PublicActivity::Activity.find(params[:id])
  end


end