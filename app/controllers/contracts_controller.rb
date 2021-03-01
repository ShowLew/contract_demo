class ContractsController < ApplicationController
	before_action :get_contract, only: [:phase_info, :invoice_info, :line_items]
	def index
		@contracts = Contract.all
	end

	def phase_info
		@renting_phases = @contract.renting_phases
	end

	def invoice_info

	end

	def line_items

	end

	private
	def get_contract
		@contract = Contract.find_by(id: params[:id])
	end
end
