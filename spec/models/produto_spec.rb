require 'rails_helper'

RSpec.describe Produto, :type => :model do
  it { should belong_to(:artista) }
  it { should belong_to(:fabrica) }
  it { should validate_presence_of :nome }
  it { should validate_presence_of :url_unica }
  it { should validate_uniqueness_of :url_unica }
  it "url_unica aceita apenas letras minusculas e números" do
    produto = Produto.create url_unica: "Teste"
    expect(produto).to_not be_valid
    expect(produto.errors).to have_key(:url_unica)
  end
  it { should validate_presence_of :preco }
  it { should validate_numericality_of :preco }
  it { should validate_presence_of :preco_promocional }
  it { should validate_numericality_of :preco_promocional }
  it "preco_promocional deve ser menor que o preco" do
    produto = create :produto
    produto.preco_promocional = 56
    expect(produto).to_not be_valid
    expect(produto.errors).to have_key(:preco_promocional)
  end
  it { should validate_presence_of :peso}
  it { should validate_numericality_of :peso}
  it { should validate_presence_of :quantidade_estoque }
  it { should validate_numericality_of :quantidade_estoque }
  it { should have_and_belong_to_many :categorias }
end
