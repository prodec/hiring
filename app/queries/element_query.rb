class ElementQuery

  def initialize(params)
    @relations = Element.includes({highway: :direction}, :conservation)
    @params   = params
  end

  def search
    @results = @relations
    if @params[:search].present?
      @results = with_conservation_id
      @results = with_highway
      @results = with_direction
    end
    @results
  end

  def with_conservation_id
    @results = @results.where("conservation_id = ?", @params[:search][:conservation_id]) if @params[:search][:conservation_id].present?    
    @results
  end

  def with_highway
    @results = @results.joins(:highway).where("highways.name = ?", @params[:search][:highway]) if @params[:search][:highway].present?    
    @results
  end

  def with_direction
    @results = @results.joins({highway: :direction}).where("directions.name = ?", @params[:search][:direction]) if @params[:search][:direction].present?   
    @results
  end

end