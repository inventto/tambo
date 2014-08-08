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
      @pessoa = Pessoa.create nome: "Jônatas Davi Paganini",
        biografia: "Nerds life",
        iniciou_em: "2014-07-25",
        email: "jonatasdp@gmail.com",
        url_unica: "jonatasdp",
        cidade: Cidade.first, #FactoryGirl.create(:cidade),
        foto_perfil: File.new(Rails.root.join("spec/fixtures/jonatasdp.png"))
     puts @pessoa.errors.full_messages

    end
    it "espera ver lista de artistas" do
      visit '/artistas'
      expect(page).to have_content 'Artistas'
      expect(page).to have_content @pessoa.nome
      click_link(@pessoa.nome)
      expect(page.current_path).to eql("/#{@pessoa.url_unica}")
      expect(page).to have_content "Portfólio"
    end
    after :all do
      Pessoa.where(url_unica: "jonatasdp").destroy_all
    end
  end
  it "com css" do
    visit'tambo_lucas_artes'
    expect(page).to have_content 'Artistas'
    expect(page).to have_css("div.artista[object-id='#{@pessoa.id}']")
  end
end
