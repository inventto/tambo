require 'rails_helper'

RSpec.describe Vitrine, :type => :model do
   #it { should has_and_belongs_to_many(:categoria) }
  it { should validate_presence_of(:nome) }
  it { should validate_uniqueness_of(:nome) }
  it { should have_attached_file(:imagem)}
end 
