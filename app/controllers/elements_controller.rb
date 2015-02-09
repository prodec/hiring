class ElementsController < ApplicationController

  def index
    @elements = Element.search(params).decorate
  end

end