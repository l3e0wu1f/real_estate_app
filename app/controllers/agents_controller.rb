class AgentsController < ApplicationController
  before_action :set_agent, only: %i[ show edit update destroy ]

  # GET /agents or /agents.json
  def index
    @agents = Agent.all

    if params[:q].present?
      @agents = @agents.search_full_text(params[:q])
    end

    @agents = @agents.with_fullname(params[:fullname]) if params[:fullname].present?
    @agents = @agents.with_phone(params[:phone]) if params[:phone].present?
  end

  # GET /agents/1 or /agents/1.json
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  def update
    # Attach new photos if provided
    if agent_params[:photos].present?
      @agent.photos.attach(agent_params[:photos])
    end

    # Update everything except photos
    if @agent.update(agent_params.except(:photos))
      redirect_to @agent, notice: "Agent profile was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # POST /agents or /agents.json
  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        format.html { redirect_to @agent, notice: "Agent profile was successfully created." }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1 or /agents/1.json
  def destroy
    @agent.destroy!

    respond_to do |format|
      format.html { redirect_to agents_path, notice: "Agent profile was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def agent_params
      params.require(:agent).permit(
        :fullname,
        :bio,
        :phone,
        photos: []
      )
    end
end
