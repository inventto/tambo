# encoding: utf-8
require 'rails_helper'

RSpec.describe Categoria, :type => :model do
  it { should belong_to(:categoria) }
  it { should validate_presence_of(:nome) }
  it { should validate_uniqueness_of(:nome) }
  it "não pode associar a si mesmo como categoria pai" do
    categoria = Categoria.create nome: "vitrine"
    categoria.categoria = categoria
    expect(categoria).to_not be_valid 
    expect(categoria.errors).to have_key(:categoria)
  end
end
