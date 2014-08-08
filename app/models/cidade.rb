class Cidade < ActiveRecord::Base
  has_many :pessoas
  belongs_to :estado
  validates :nome, presence: true, uniqueness: true
  validates :estado, associated: true, presence: true
  def to_s
    [nome, estado].join(" - ")
  end
end