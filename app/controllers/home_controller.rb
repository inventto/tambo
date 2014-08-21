class HomeController < ApplicationController
  def index
    @categorias = Categoria.all
  end
end
