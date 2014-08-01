# encoding: utf-8
require 'rails_helper'

RSpec.describe Cidade, :type => :model do
  it { should have_many(:pessoas) }
  it { should validate_presence_of(:nome) }
  it { should validate_uniqueness_of(:nome) }

  it "não pode criar uma cidade em um estado invalido" do
  	cidade = Cidade.create nome:"Francisco Beltrão", estado:"PT"
  	#expect(cidade).to_not be_valid
    expect(cidade.errors).to have_key(:estado)
  end
end
