class ElementDecorator < Draper::Decorator
  delegate_all
  delegate :name, to: :highway, prefix: true
  delegate :number, to: :conservation, prefix: true

  def direction_name
    highway.direction.name
  end

end
