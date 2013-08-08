  def show
    @match = Match.find(params[:id])
  end

  def index
    @matches = Match.paginate(page: params[:page], per_page: 50)
  end

  def recent_matches
  end
end
