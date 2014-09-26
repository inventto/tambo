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
        produto.imagens.first.anexo.url(:thumb)
      else
        'imagem_produto_default.png'
      end
    image_tag(src, opts)
  end
  def limitar(text)
    if text.size < 200
      return text
    else
      text[0,200]+"..."
    end
  end
  def bar_item opts
    #<li tooltip title="Veja o perfil do artista." data-placement="bottom">
    #<a href="#"><span class="icon-user-following medium-icon" > </span><br>Perfil</a></li>

    content_tag(:li,
        link_to(
          tag(:span, class: "icon-#{opts[:icon]} medium-icon")+
          tag(:br)+
          opts[:label]),
       title: opts[:tooltip],
       tooltip: "",
       "data-placement" => "bottom")
  end
end
