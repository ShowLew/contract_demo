namespace :contract do
	desc "检查生成账单"
	task create_contract_invoices: :environment do
		RentingPhase.where("renting_phases.pay_at > '?'", (Time.now + 3.day)).each do |renting_phase|
			invoice = Invoice.new(contract_id: renting_phase.contract_id, renting_phase_id: renting_phase.id,
			                      phase_money: renting_phase.phase_money)
			invoice.save
		end
	end
end