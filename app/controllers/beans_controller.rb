class BeansController < ApplicationController
  def index
    @beans = Bean.all

    render("beans/index.html.erb")
  end

  def show
    @bean_like = BeanLike.new
    @bean_drink = BeanDrink.new
    @bean = Bean.find(params[:id])

    render("beans/show.html.erb")
  end

  def new
    @bean = Bean.new

    render("beans/new.html.erb")
  end

  def create
    @bean = Bean.new

    @bean.bean = params[:bean]
    @bean.roaster_id = params[:roaster_id]

    save_status = @bean.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beans/new", "/create_bean"
        redirect_to("/beans")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean created successfully.")
      end
    else
      render("beans/new.html.erb")
    end
  end

  def edit
    @bean = Bean.find(params[:id])

    render("beans/edit.html.erb")
  end

  def update
    @bean = Bean.find(params[:id])

    @bean.bean = params[:bean]
    @bean.roaster_id = params[:roaster_id]

    save_status = @bean.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/beans/#{@bean.id}/edit", "/update_bean"
        redirect_to("/beans/#{@bean.id}", :notice => "Bean updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean updated successfully.")
      end
    else
      render("beans/edit.html.erb")
    end
  end

  def destroy
    @bean = Bean.find(params[:id])

    @bean.destroy

    if URI(request.referer).path == "/beans/#{@bean.id}"
      redirect_to("/", :notice => "Bean deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bean deleted.")
    end
  end
end
