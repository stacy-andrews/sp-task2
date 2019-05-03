class WelcomeController < ApplicationController
  def index
    @cronut_url = cronut_url
    @donut_url = donut_url
  end

  private

  def cronut_url
    return params[:cronut_url] if params[:cronut_url]

    "https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg"
  end

  def donut_url
    return params[:donut_url] if params[:donut_url]

    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg"
  end
end
