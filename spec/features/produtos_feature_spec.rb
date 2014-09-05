require "rails_helper"

describe "produtos", :type => :feature do
  context "com_produtos" do
    before :all do
      @produto = Produto.first || FactoryGirl.create(:produto)
      @produto.artista = Pessoa.first || FactoryGirl.build(:pessoa)
      @produto.save
    end
    it "espera ter produtos" do
      visit "/produtos"
      expect(page).to have_content "Produtos"
      expect(page).to have_content @produto.nome
      click_link(@produto.nome)
      expect(page.current_path).to eql("/#{@produto.url_unica}")
      expect(page).to have_content @produto.nome
    end
    it "espera abrir artista" do
      visit "/produtos"
      click_link(@produto.artista.nome)
      expect(page.current_path).to eql("/#{@produto.artista.url_unica}")
      expect(page).to have_content @produto.artista.nome
    end
    after :all do
      Produto.destroy_all
    end
  end
  context "sem produtos" do
    before :all do
      Produto.destroy_all
    end
    it "espera nao ter produtos" do
      visit "/produtos"
      expect(page).to have_content "Nenhum produto cadastrado"
    end
  end
end
