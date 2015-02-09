class ElementsController < ApplicationController

  def index    
    @elements = Element.includes({highway: :direction}, :conservation)
  end

end