class Estado < ActiveRecord::Base
	validates :sigla, :nome, presence: true, uniqueness: true
	def to_s
		sigla
		
	end
end
