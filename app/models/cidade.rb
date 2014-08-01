class Cidade < ActiveRecord::Base
  has_many :pessoas
  validates :nome, presence: true, uniqueness: true
  validates :estado, inclusion: {in: %w(SC PR SP MG)}, presence: true
  def to_s
    [nome, estado].join(" - ")
  end
end
