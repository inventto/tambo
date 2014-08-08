require "rails_helper"
describe "artistas", :type => :feature do
  context "sem artistas no programa" do
    it "espera nao deve ver ninguem na lista" do
      visit '/artistas'
      expect(page).to have_content 'Nenhum artista cadastrado'
    end
  end
  context "com artistas no programa" do
    before :all do
      Pessoa.create nome: "Jônatas Davi Paganini",
      biografia: "Nerds life",
      iniciou_em: "2014-07-25",
      url_unica: "jonatasdp",
      cidade: FactoryGirl.create(:cidade),
      foto_perfil: new File(Rails.root.join("spec/fixtures/jonatasdp.png"))

    end
    it "espera ver lista de artistas" do
      visit '/artistas'
      expect(page).to have_content 'Artistas'
      expect(page).to have_content Artista.first.nome
      expect(page).to should have_css('table tr.foo')
    end
    after :all do
      Pessoa.where(url_unica: "jonatasdp").destroy_all
    end
  end
end
