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
      f.title(text: "Progressão")
      f.series(name: "R$", yAxis: 0, data: [200, 400, 700, 900, 1200 ] )
      f.chart({defaultSeriesType: "line"})
    end
    render :partial => "chart"
  end

end
