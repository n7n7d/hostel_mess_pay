class RateCardsController < ApplicationController
  def new
  end

  def create
  end
  def show
    @rate_card = RateCard.find(params[:id])
  end

end
