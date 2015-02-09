class ElementsController < ApplicationController

  def index
    @elements = ElementQuery.new(params).search.decorate
  end

end