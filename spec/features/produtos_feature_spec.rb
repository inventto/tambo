require "rails_helper"

describe "produtos", :type => :feature do
  context "listar" do
    before :all do
      @produto = Produto.first || FactoryGirl.create(:produto)
    end
    it "espera ter produtos" do
      visit "/produtos"
      expect(page).to have_content "Produtos"
      expect(page).to have_content @produto.nome
      click_link(@produto.nome)
      expect(page.current_path).to eql("/#{@produto.url_unica}")
      expect(page).to have_content @produto.nome
    end
    after :all do
      Produto.destroy_all
    end
  end
end
