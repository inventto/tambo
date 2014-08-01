# encoding: utf-8
require 'rails_helper'

RSpec.describe Cidade, :type => :model do
  it { should belong_to(:nome) }
  it { should validate_presence_of(:nome) }
  it { should validate_uniqueness_of(:nome) }
  it "não pode criar uma cidade em um estado invalido" do
    expect(cidade.errors).to have_key(:estado)
  end
end
