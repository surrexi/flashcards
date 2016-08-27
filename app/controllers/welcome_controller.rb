class WelcomeController < ApplicationController
  def index
    @card = Card.rand_card
  end
end
