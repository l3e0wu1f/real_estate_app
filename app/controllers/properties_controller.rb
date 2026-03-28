class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all

    if params[:q].present?
      @properties = @properties.search_full_text(params[:q])
    end

    @properties = @properties.min_price(params[:min_price])
    @properties = @properties.max_price(params[:max_price])
    @properties = @properties.bedrooms(params[:bedrooms])
    @properties = @properties.bathrooms(params[:bathrooms])
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  def update
    # Attach new photos if provided
    if property_params[:photos].present?
      @property.photos.attach(property_params[:photos])
    end

    # Update everything except photos
    if @property.update(property_params.except(:photos))
      redirect_to @property, notice: "Property was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy!

    respond_to do |format|
      format.html { redirect_to properties_path, notice: "Property was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(
        :title,
        :description,
        :price,
        :bedrooms,
        :bathrooms,
        :address,
        photos: []
      )
    end
end
