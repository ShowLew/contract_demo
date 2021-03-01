#### README

* Ruby version  2.6.5
 
* Test
 ```ruby
begin_at = Time.parse("2020-11-16")
end_at = Time.parse("2021-03-16")
month_money = 5000
phase = 2
first_pay_at = Time.parse("2020-11-15")


contract = Contract.create!(begin_at: begin_at, end_at: end_at, phase: phase, first_pay_at: first_pay_at, month_money: month_money)

contract.save # 修改之后自动生成合同总金额

contract.re_create_renting_phase # 保存之后自动更新阶段信息
``` 

* 定时任务
```ruby
rake contract:create_contract_invoices
```
* 图片式例 
```ruby
"/assets/images/contract.png"
"/assets/images/renting_phase.png"
```