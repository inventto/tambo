class ArtistasController < ApplicationController
  def index
    @artistas = Pessoa.all
  end

  def show
  end
end
