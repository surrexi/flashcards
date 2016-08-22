class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :update, :destroy, :show]

  def index
    @cards = Card.all
    @card = rand_record
    flash[:notice] = nil
  end

  def show
    render 'edit'
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy

    redirect_to cards_path
  end

  def repeat
    @cards = Card.all
    @card = find_card
    if @card.equal_origin_text?(card_params[:original_text])
      @card.update_review_date
      redirect_to cards_path
    else
      flash[:notice] = 'Wrong original text'
      render :index
    end
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def rand_record
    cards_for_repeating = Card.expired_date
    offset = rand(cards_for_repeating.count)
    cards_for_repeating.offset(offset).first
  end
end
