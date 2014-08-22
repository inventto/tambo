class ArtistasController < ApplicationController
  def index
    @artistas = Pessoa.all
  end

  def show
    @artista = Pessoa.find(params[:id])
    render :show
  end

end
