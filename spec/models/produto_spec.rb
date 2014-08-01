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
end
