module ApplicationHelper
  def uniq_url_for(object)
    object.url_unica
  end
  if Rails.env.production?
    def image_tag(name,opts={})
      if name != asset_path(name)
        name = asset_path(name)
      end
      super(name, opts)
    end
  end
  def show_first_image_or_default_for(produto, opts={})
    src =
      if not produto.imagens.blank?
        produto.imagens.first.anexo.url(:thumb)
      else
        'imagem_produto_default.png'
      end
    image_tag(src, opts)
  end
end
