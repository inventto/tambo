#encoding: utf-8
class ArtistasController < ApplicationController
  def index
    @artistas = Pessoa.all
  end

  def show
    @artista = Pessoa.find(params[:id])
    render :show
  end

  def chart
    @chart =  LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Número de chaves de roda no mundo")
      f.xAxis(categories: %w(EUA  Japão  Brasil ))
      f.series(name: "Chaves de rodas em milhões", yAsis: 0, data: [3000, 10000, 7000] )
      f.series(name: "População em milhões", yAsis: 0, data: [300, 1000, 2000] )
      f.yAxis [
        {title: { text: "Chaves de Rodas em milhões", margin: 70 }},
        {title: { text: "População em milhões" }, opposite: true},
      ]

      f.legend(align: "right", verticalAlign: "top", y: 75, x: -50, layout: "vertical")
      f.chart({defaultSeriesType: "line"})
    end
  end

end
