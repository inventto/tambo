MODELOS = %w(Vitrine Cidade Categoria)
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0


  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.excluded_models += [CategoriaVitrine, FabricaProduto, ArtistaProduto]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  MODELOS.each do |model|
    config.model model do
      object_label_method do
        :to_s
      end
    end
  end
end
