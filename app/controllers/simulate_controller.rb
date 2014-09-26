#encoding: utf-8
class SimulateController < ApplicationController
  def index
    @templates = {
      quadros: {
        "3x3" => {
          titulo: "Quadro 3x3",
          preco: 100.reais
        },
        "4x4" => {
          titulo: "Quadro 4x4",
          preco: 150.reais
        }
      },
      bistro: {
        "50cm" => {
          titulo: "Bistro 50cm",
          preco: 150.reais
        },
        "60cm" => {
          titulo: "Bistro 60cm",
          preco: 200.reais
        },
        "materias" => {
          madeira: %w(Carvão Chocolate Azul),
          ceramica: "branco"
        }
      }
    }
  end
end
