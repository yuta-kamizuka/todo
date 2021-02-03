class CardController < ApplicationController
  def new
    @card = Card.new
    @list = List.find_by(params[:id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private

    def card_params
      params.require(:card).permit(
        :title,
        :memo,
        :list_id
      )
    end

end
