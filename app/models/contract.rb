class Contract < ApplicationRecord
	has_many :renting_phases


	# 合同开始结束日期为2020-11-16到2021-03-16号，每月租金5000
	before_save do
		self.total_money = create_total_money(begin_at, end_at)
	end

	after_save do
		re_create_renting_phase
	end

	def re_create_renting_phase
		self.renting_phases.destroy_all

		all_month = all_months(begin_at, end_at)
		phase_count = (all_month.to_f / phase).ceil
		renting_phase_end_at = Time.now
		(1..phase_count).each do |count|

			if count == 1
				renting_phase_begin_at = begin_at.beginning_of_day
				renting_phase_end_at = ((renting_phase_begin_at + (phase - 1).month).end_of_month).beginning_of_day
			else
				renting_phase_begin_at = (renting_phase_end_at + 1.day).beginning_of_day
				renting_phase_end_at = ((renting_phase_begin_at + (phase - 1).month).end_of_month).beginning_of_day
			end
			if count == phase_count
				renting_phase_end_at = end_at
			end
			phase_money = create_phase_money(renting_phase_begin_at, renting_phase_end_at)
			self.renting_phases.create!(pay_at: (renting_phase_begin_at.beginning_of_month + 14.day).beginning_of_day, phase_money: phase_money,
			                            begin_at: renting_phase_begin_at, end_at: renting_phase_end_at)
		end
	end

	def create_phase_money(begin_at, end_at)
		total = 0
		all_month = all_months(begin_at, end_at)
		unless begin_at.day == 1
			all_month -= 1
			total += (begin_at.end_of_month.day - begin_at.day + 1) * per_day_money
		end
		unless end_at.day == end_at.end_of_month.day
			all_month -= 1
			total += (end_at.end_of_month.day - end_at.day + 1) * per_day_money
		end
		total + month_money * all_month
	end

	def create_total_money(begin_at, end_at)
		create_phase_money(begin_at, end_at)
	end

	def per_day_money
		(month_money * 12).to_f / Time.days_in_year
	end

	def all_months(begin_at, end_at)
		(end_at.year * 12 + end_at.month) - (begin_at.year * 12 + begin_at.month) + 1
	end
end
