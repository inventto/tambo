require 'rails_helper'

RSpec.describe Vitrine, :type => :model do
  it { should have_and_belong_to_many(:categorias) }
  it { should validate_presence_of(:nome) }
  it { should validate_uniqueness_of(:nome) }
  it { should have_attached_file(:imagem)}
  it {should validate_attachment_content_type(:imagem).allowing('image/png', 'image/gif', 'image/jpg')}
end 
