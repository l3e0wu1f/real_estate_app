class AgentSearch
  def initialize(params)
    @params = params
  end

  def results
    agents = Agent.all

    agents = agents.search_full_text(@params[:q]) if @params[:q].present?
    agents = agents.phone(@params[:phone])
    agents = agents.bio(@params[:bio])

    agents
  end
end
