class BeanDrinksController < ApplicationController
  def index
    @q = BeanDrink.ransack(params[:q])
    @bean_drinks = @q.result(:distinct => true).includes(:bean, :drink).page(params[:page]).per(10)

    render("bean_drinks/index.html.erb")
  end

  def show
    @bean_drink = BeanDrink.find(params[:id])

    render("bean_drinks/show.html.erb")
  end

  def new
    @bean_drink = BeanDrink.new

    render("bean_drinks/new.html.erb")
  end

  def create
    @bean_drink = BeanDrink.new

    @bean_drink.bean_id = params[:bean_id]
    @bean_drink.drink_id = params[:drink_id]

    save_status = @bean_drink.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bean_drinks/new", "/create_bean_drink"
        redirect_to("/bean_drinks")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean drink created successfully.")
      end
    else
      render("bean_drinks/new.html.erb")
    end
  end

  def edit
    @bean_drink = BeanDrink.find(params[:id])

    render("bean_drinks/edit.html.erb")
  end

  def update
    @bean_drink = BeanDrink.find(params[:id])

    @bean_drink.bean_id = params[:bean_id]
    @bean_drink.drink_id = params[:drink_id]

    save_status = @bean_drink.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bean_drinks/#{@bean_drink.id}/edit", "/update_bean_drink"
        redirect_to("/bean_drinks/#{@bean_drink.id}", :notice => "Bean drink updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bean drink updated successfully.")
      end
    else
      render("bean_drinks/edit.html.erb")
    end
  end

  def destroy
    @bean_drink = BeanDrink.find(params[:id])

    @bean_drink.destroy

    if URI(request.referer).path == "/bean_drinks/#{@bean_drink.id}"
      redirect_to("/", :notice => "Bean drink deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bean drink deleted.")
    end
  end
end
