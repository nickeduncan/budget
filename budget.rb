@weeks_in_month = 5.333
@weeks_in_year = 52.18

mdlive_gross_annual_income = 57000.00 # your income

mdlive_biweekly_HSA = 26.40
mdlive_biweekly_dental = 8.67
percentage_401k_contribution = 0.05 # percent to decimal

rent_monthly_expense = 1500.00

cable_monthly_bill = 110.00
electricity_monthly_bill = 100.00
gas_monthly_bill = 0.00

groceries_weekly_expense = 100.00

savings_rate = 0.40 # percent to decimal

def weekly(annual)
  (annual / @weeks_in_year).round(2)
end

def biweekly(annual)
  (annual / @weeks_in_year * 2).round(2)
end

def monthly(annual)
  (annual / 12).round(2)
end

def annual_taxes(gross_annual_income)
  (gross_annual_income - @tax_bracket_floor) * @tax_rate + @tax_bracket_base
end

def taxed_annual_income(gross_annual_income, annual_taxes)
  gross_annual_income - annual_taxes
end

mdlive_gross_weekly_income = weekly(mdlive_gross_annual_income)
mdlive_gross_biweekly_income = biweekly(mdlive_gross_annual_income)
mdlive_gross_monthly_income = monthly(mdlive_gross_annual_income)


case mdlive_gross_annual_income
when 0..9325.00
  @tax_rate = 0.10
  @tax_bracket_base = 0.00
  @tax_bracket_floor = 0.00
when 9325.00..37950.00
  @tax_rate = 0.15
  @tax_bracket_base = 932.50
  @tax_bracket_floor = 9325.00
when 37950.00..91900.00
  @tax_rate = 0.25
  @tax_bracket_base = 5226.25
  @tax_bracket_floor = 37950.00
when 91900.00..191650.00
  @tax_rate = 0.28
  @tax_bracket_base = 18713.75
  @tax_bracket_floor = 91900.00
when 191650.00..416700.00
  @tax_rate = 0.33
  @tax_bracket_base = 46643.75
  @tax_bracket_floor = 191650.00
when 416700.00..416700.00
  @tax_rate = 0.35
  @tax_bracket_base = 120910.25
  @tax_bracket_floor = 416700.00
when 416700.00..100000000
  @tax_rate = 0.3960
  @tax_bracket_base = 121505.25
  @tax_bracket_floor = 418400.00
else
  puts("tax calculation error")
end

mdlive_annual_taxes = annual_taxes(mdlive_gross_annual_income)
mdlive_taxed_annual_income = taxed_annual_income(mdlive_gross_annual_income, mdlive_annual_taxes)
mdlive_taxed_monthly_income = monthly(mdlive_taxed_annual_income)
mdlive_taxed_weekly_income = weekly(mdlive_taxed_annual_income)
mdlive_taxed_biweekly_income = biweekly(mdlive_taxed_annual_income)

percentage_401k_match = if (percentage_401k_contribution >= 0.05)
  0.04
elsif (percentage_401k_contribution > 0.03)
  0.03 + (percentage_401k_contribution - 0.03) / 2
else
  percentage_401k_contribution
end

mdlive_annual_401k = mdlive_gross_annual_income * percentage_401k_contribution
mdlive_annual_matched_401k = mdlive_annual_401k + mdlive_gross_annual_income * percentage_401k_match
mdlive_annual_roth_401k = mdlive_taxed_annual_income * percentage_401k_contribution
mdlive_annual_roth_matched_401k = mdlive_annual_roth_401k + mdlive_taxed_annual_income * percentage_401k_match

mdlive_biweekly_benefits = mdlive_biweekly_dental + mdlive_biweekly_HSA
mdlive_annual_benefits = (mdlive_biweekly_benefits * @weeks_in_year / 2).round(2)

# incruises_hourly_rate = 20.00
# incruises_fulltime_weekly_hours = 40
# incruises_partime_weekly_hours = 10
# incruises_fulltime_weekly_gross_income = incruises_hourly_rate * incruises_fulltime_weekly_hours
# incruises_fulltime_monthly_gross_income = incruises_fulltime_weekly_gross_income * weeks_in_month
# incruises_partime_weekly_gross_income = incruises_hourly_rate * incruises_partime_weekly_hours
# incruises_partime_monthly_gross_income = incruises_partime_weekly_gross_income*weeks_in_month
# incruises_partime_annual_gross_income = incruises_partime_weekly_hours * @weeks_in_year
# incruises_annual_gross_income = incruises_fulltime_monthly_gross_income+incruises_partime_monthly_gross_income*11
#
# combined_gross_annual_income = incruises_partime_annual_gross_income + mdlive_gross_annual_income
# combined_gross_annual_income = incruises_annual_gross_income + mdlive_annual_gross_income

# combined_annual_taxes = (combined_gross_annual_income)*tax_rate-tax_bracket_base
# combined_taxed_annual_income = combined_gross_annual_income - annual_taxes
# combined_taxed_annual_monthly_income = taxed_annual_income/12
# combined_taxed_annual_weekly_income = taxed_annual_income/@weeks_in_year

utilities_monthly_expense = cable_monthly_bill + electricity_monthly_bill + gas_monthly_bill
utilities_annual_expense = utilities_monthly_expense * 12

rent_annual_expense = rent_monthly_expense * 12

groceries_annual_expense = groceries_weekly_expense * @weeks_in_year

annual_expenses = rent_annual_expense + utilities_annual_expense + groceries_annual_expense
monthly_expenses = monthly(annual_expenses)
biweekly_expenses = biweekly(annual_expenses)
weekly_expenses = weekly(annual_expenses)

net_annual_income = (mdlive_taxed_annual_income - annual_expenses - mdlive_annual_roth_401k - mdlive_annual_benefits).round(2)
net_monthly_income = monthly(net_annual_income)
net_biweekly_income = biweekly(net_annual_income)
net_weekly_income = weekly(net_annual_income)

annual_savings = (net_annual_income * savings_rate).round(2)
monthly_savings = monthly(annual_savings)
biweekly_savings = biweekly(annual_savings)
weekly_savings = weekly(annual_savings)

annual_disposable_income = (net_annual_income - annual_savings).round(2)
weekly_disposable_income = weekly(annual_disposable_income)
biweekly_disposable_income = biweekly(annual_disposable_income)
monthly_disposable_income = monthly(annual_disposable_income)


puts("This Year:\n\n")

puts("Gross Income: #{mdlive_gross_annual_income}")
puts("Gross Monthly Income: #{mdlive_gross_monthly_income}")
puts("Gross Biweekly Income: #{mdlive_gross_biweekly_income}")
puts("Gross Weekly Income: #{mdlive_gross_weekly_income}\n\n")

puts("Taxes: #{mdlive_annual_taxes}\n\n")
puts("Taxed Income: #{mdlive_taxed_annual_income}")
puts("Taxed Monthly Income: #{mdlive_taxed_monthly_income}")
puts("Taxed Biweekly Income: #{mdlive_taxed_biweekly_income}")
puts("Taxed Weekly Income: #{mdlive_taxed_weekly_income}\n\n")

puts("Annual Expenses*: #{annual_expenses}")
puts("Monthly Expenses: #{monthly_expenses}")
puts("Biweekly Expenses: #{biweekly_expenses}")
puts("Weekly Expenses: #{weekly_expenses}\n\n")

puts("Net Income**: #{net_annual_income}")
puts("Net Monthly Income: #{net_monthly_income}")
puts("Net Biweekly Income: #{net_biweekly_income}")
puts("Net Weekly Income: #{net_weekly_income}\n\n")

puts("Annual Savings†: #{annual_savings}")
puts("Monthly Savings: #{monthly_savings}")
puts("Biweekly Savings: #{biweekly_savings}")
puts("Weekly Savings: #{weekly_savings}\n\n")

puts("Annual Roth 401k Contribution: #{mdlive_annual_roth_matched_401k}")
puts("Total Standard 401k Balance: #{mdlive_annual_matched_401k / 3}\n\n")

puts("Annual Disposable Income: #{annual_disposable_income}")
puts("Monthly Disposable Income: #{monthly_disposable_income}")
puts("Biweekly Disposable Income: #{biweekly_disposable_income}")
puts("Weekly Disposable Income: #{weekly_disposable_income}\n\n\n")


puts("* rent, utilities, groceries")
puts("** minus expenses and benefits")
puts("† 40%")
