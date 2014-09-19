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
      @pessoa = create :pessoa
    end
    it "espera ver lista de artistas" do
      visit '/artistas'
      expect(page).to have_content 'Artistas'
      expect(page).to have_content @pessoa.nome
      click_link(@pessoa.nome)
      expect(page.current_path).to eql("/#{@pessoa.url_unica}")
      expect(page).to have_content "Portfólio"
    end
    it "com css" do
      visit'tambo_lucas_artes'
      expect(page).to have_content 'Artistas'
      expect(page).to have_css("div.artista[object-id='#{@pessoa.id}']")
    end
  end
end
