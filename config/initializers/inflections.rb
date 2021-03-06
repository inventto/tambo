# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
   inflect.plural /([^aeiouãé][aeiou])$/i, '\1s'
   #inflect.singular /^x)en/i, '\1'
   inflect.irregular 'produto_artista', 'produtos_artistas'
   inflect.irregular 'imagem', 'imagens'
   inflect.irregular 'colecao', 'colecoes'
   inflect.irregular 'colecao_produto', 'colecoes_produtos'
#   inflect.uncountable %w( fish sheep )
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
