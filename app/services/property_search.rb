class PropertySearch
  def initialize(params)
    @params = params
  end

  def results
    properties = Property.all

    properties = properties.search_full_text(@params[:q]) if @params[:q].present?
    properties = properties.min_price(@params[:min_price])
    properties = properties.max_price(@params[:max_price])
    properties = properties.bedrooms(@params[:bedrooms])
    properties = properties.bathrooms(@params[:bathrooms])
    properties = properties.near_location(@params[:location], @params[:radius])

    properties
  end
end