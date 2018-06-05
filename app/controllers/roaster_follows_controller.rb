class RoasterFollowsController < ApplicationController
  before_action :current_user_must_be_roaster_follow_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_roaster_follow_user
    roaster_follow = RoasterFollow.find(params[:id])

    unless current_user == roaster_follow.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @roaster_follows = RoasterFollow.all

    render("roaster_follows/index.html.erb")
  end

  def show
    @roaster_follow = RoasterFollow.find(params[:id])

    render("roaster_follows/show.html.erb")
  end

  def new
    @roaster_follow = RoasterFollow.new

    render("roaster_follows/new.html.erb")
  end

  def create
    @roaster_follow = RoasterFollow.new

    @roaster_follow.user_id = params[:user_id]
    @roaster_follow.roaster_id = params[:roaster_id]

    save_status = @roaster_follow.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roaster_follows/new", "/create_roaster_follow"
        redirect_to("/roaster_follows")
      else
        redirect_back(:fallback_location => "/", :notice => "Roaster follow created successfully.")
      end
    else
      render("roaster_follows/new.html.erb")
    end
  end

  def edit
    @roaster_follow = RoasterFollow.find(params[:id])

    render("roaster_follows/edit.html.erb")
  end

  def update
    @roaster_follow = RoasterFollow.find(params[:id])
    @roaster_follow.roaster_id = params[:roaster_id]

    save_status = @roaster_follow.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/roaster_follows/#{@roaster_follow.id}/edit", "/update_roaster_follow"
        redirect_to("/roaster_follows/#{@roaster_follow.id}", :notice => "Roaster follow updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Roaster follow updated successfully.")
      end
    else
      render("roaster_follows/edit.html.erb")
    end
  end

  def destroy
    @roaster_follow = RoasterFollow.find(params[:id])

    @roaster_follow.destroy

    if URI(request.referer).path == "/roaster_follows/#{@roaster_follow.id}"
      redirect_to("/", :notice => "Roaster follow deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Roaster follow deleted.")
    end
  end
end
