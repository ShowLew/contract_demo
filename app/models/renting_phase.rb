class RentingPhase < ApplicationRecord
	belongs_to :contract
	has_one :invocie
end
