require "redcarpet"

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
  def markdown(text)
   Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true).render(text).html_safe
  end
  def show_first_image_or_default_for(produto, opts={})
    src =
      if not produto.imagens.blank?
        produto.imagens.first.anexo.url(opts[:image_size] || :thumb)
      else
        'imagem_produto_default.png'
      end
    image_tag(src, opts)
  end
end
