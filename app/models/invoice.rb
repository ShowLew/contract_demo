class Invoice < ApplicationRecord
	belongs_to :contact
	belongs_to :renting_phase
end
