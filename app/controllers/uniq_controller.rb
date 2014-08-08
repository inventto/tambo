class UniqController < ApplicationController
  def  show
    object = Pessoa.where(url_unica: params[:uniq_url]).first ||
             Produto.where(url_unica: params[:uniq_url]).first

    if object
      obj_name = object.class.name.downcase
      obj_name.gsub!(/pessoa/,"artista")
      instance_variable_set("@#{obj_name}", object)
      render "#{obj_name.pluralize}/show"
    else
      redirect_to root_path, info: "#{params[:uniq_url]} não encontrada!"
    end
  end
end
