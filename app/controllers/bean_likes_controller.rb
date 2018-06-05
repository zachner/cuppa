class BeanLikesController < ApplicationController
  before_action :current_user_must_be_bean_like_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_bean_like_user
    bean_like = BeanLike.find(params[:id])

    unless current_user == bean_like.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @bean_likes = current_user.bean_likes.page(params[:page]).per(10)

    render("bean_likes/index.html.erb")
  end

  def show
    @bean_like = BeanLike.find(params[:id])

    render("bean_likes/show.html.erb")
  end

  def new
    @bean_like = BeanLike.new

    render("bean_likes/new.html.erb")
  end

  def create
    @bean_like = BeanLike.new

    @bean_like.user_id = params[:user_id]
    @bean_like.bean_id = params[:bean_id]

    save_status = @bean_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bean_likes/new", "/create_bean_like"
        redirect_to("/bean_likes")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean like created successfully.")
      end
    else
      render("bean_likes/new.html.erb")
    end
  end

  def edit
    @bean_like = BeanLike.find(params[:id])

    render("bean_likes/edit.html.erb")
  end

  def update
    @bean_like = BeanLike.find(params[:id])
    @bean_like.bean_id = params[:bean_id]

    save_status = @bean_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bean_likes/#{@bean_like.id}/edit", "/update_bean_like"
        redirect_to("/bean_likes/#{@bean_like.id}", :notice => "Bean like updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean like updated successfully.")
      end
    else
      render("bean_likes/edit.html.erb")
    end
  end

  def destroy
    @bean_like = BeanLike.find(params[:id])

    @bean_like.destroy

    if URI(request.referer).path == "/bean_likes/#{@bean_like.id}"
      redirect_to("/", :notice => "Bean like deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bean like deleted.")
    end
  end
end
