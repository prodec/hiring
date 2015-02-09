class ElementsController < ApplicationController

  def index
    @elements = Element.search(params)
  end

end