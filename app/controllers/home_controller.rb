class HomeController < ApplicationController
  def index
    @categorias = Categoria.all
    @colecoes = Colecao.all
  end
end
