class GamesController < ApplicationController
  def index
    @games = Game.all.where(season).order('game_number DESC')
  end

  private

  def season
    @season = params[:season]&.presence_in(%(2017 2016 2015)) || '2017'

    ["date BETWEEN ? AND ?", "#{@season}-01-01", "#{@season}-12-31"]
  end
end
