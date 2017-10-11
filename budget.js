const weeks_in_month = 5.333;
const weeks_in_year = 52.18;

let tax_bracket_floor = 37950.00;
let tax_rate = 0.25;
let tax_bracket_base = 5226.00;

let weekly = (annual) => annual / weeks_in_year;
let biweekly = (annual) => annual / weeks_in_year / 2;
let monthly = (annual) => annual / 12;

let annual_taxes = (gross_annual_income) => gross_annual_income * tax_rate - tax_bracket_base;
let taxed_annual_income = (gross_annual_income, annual_taxes) => gross_annual_income - annual_taxes;

let mdlive_gross_annual_income = 57000.00;
let mdlive_gross_weekly_income = weekly(mdlive_gross_annual_income);
let mdlive_gross_biweekly_income = biweekly(mdlive_gross_annual_income);
let mdlive_gross_monthly_income = monthly(mdlive_gross_annual_income);

let mdlive_annual_taxes = annual_taxes(mdlive_gross_annual_income);
let mdlive_taxed_annual_income = taxed_annual_income(mdlive_gross_annual_income, mdlive_annual_taxes);
let mdlive_taxed_monthly_income = monthly(mdlive_taxed_monthly_income);
let mdlive_taxed_weekly_income = weekly(mdlive_taxed_annual_income);
let mdlive_taxed_biweekly_income = biweekly(mdlive_taxed_weekly_income);

// let incruises_hourly_rate = 20.00;
// let incruises_fulltime_weekly_hours = 40;
// let incruises_partime_weekly_hours = 10;
// let incruises_fulltime_weekly_gross_income = incruises_hourly_rate * incruises_fulltime_weekly_hours;
// let incruises_fulltime_monthly_gross_income = incruises_fulltime_weekly_gross_income * weeks_in_month;
// let incruises_partime_weekly_gross_income = incruises_hourly_rate * incruises_partime_weekly_hours;
// let incruises_partime_monthly_gross_income = incruises_partime_weekly_gross_income*weeks_in_month;
// let incruises_partime_annual_gross_income = incruises_partime_weekly_hours * weeks_in_year;
// let incruises_annual_gross_income = incruises_fulltime_monthly_gross_income+incruises_partime_monthly_gross_income*11;
//
// let combined_gross_annual_income = incruises_partime_annual_gross_income + mdlive_gross_annual_income;
// let combined_gross_annual_income = incruises_annual_gross_income + mdlive_annual_gross_income;

// let combined_annual_taxes = (combined_gross_annual_income)*tax_rate-tax_bracket_base;
// let combined_taxed_annual_income = combined_gross_annual_income - annual_taxes;
// let combined_taxed_annual_monthly_income = taxed_annual_income/12;
// let combined_taxed_annual_weekly_income = taxed_annual_income/weeks_in_year;

let cable_monthly_bill = 110.00;
let electricity_monthly_bill = 100.00;
let gas_monthly_bill = 0.00;
let utilities_monthly_expense = cable_monthly_bill + electricity_monthly_bill + gas_monthly_bill;
let utilities_annual_expense = utilities_monthly_expense * 12;

let rent_monthly_expense = 1500.00;
let rent_annual_expense = rent_monthly_expense * 12;

let groceries_weekly_expense = 100.00;
let groceries_annual_expense = groceries_weekly_expense * weeks_in_year;

let annual_expenses = rent_annual_expense + utilities_annual_expense + groceries_annual_expense;

let net_annual_income = taxed_annual_income - annual_expenses;
let net_monthly_income = monthly(net_annual_income);
let net_biweekly_income = biweekly(net_annual_income)
let net_weekly_income = weekly(net_annual_income);

let savings_rate = 0.40;
let annual_savings = net_annual_income * savings_rate;
let monthly_savings = monthly(annual_savings);
let biweekly_savings = biweekly(annual_savings);
let weekly_savings = weekly(annual_savings);

let annual_disposable_income = net_annual_income - annual_savings;
let weekly_disposable_income = weekly(annual_disposable_income);
let biweekly_disposable income = biweekly(annual_disposable_income);
let monthly_disposable_income = monthly(annual_disposable_income);


console.log("This Year:");
console.log(`Gross Income: ${mdlive_gross_annual_income}`);
console.log(`Taxes: ${mdlive_annual_taxes}`);
console.log(`Taxed Income: ${mdlive_taxed_annual_income}`);
console.log(`Taxed Monthly Income: ${mdlive_taxed_monthly_income}`);
console.log(`Taxed Biweekly Income: ${mdlive_taxed_biweekly_income}`);
console.log(`Taxed Monthly Income: ${mdlive_taxed_weekly_income}`);
console.log(`Expenses: ${annual_expenses}`);
console.log(`Net Income: ${net_annual_income}`);
console.log(`Net Monthly Income: ${net_monthly_income}`);
console.log(`Net Weekly Income: ${net_weekly_income}`);
console.log(`Savings: ${annual_savings}`);
console.log(`Monthly Savings: ${monthly_savings}`);
console.log(`Weekly Savings: ${weekly_savings}`);
console.log(`Disposable Income:${annual_disposable_income}`);
console.log(`Monthly Disposable Income: ${monthly_disposable_income}`);
console.log(`Weekly Disposable Income: ${weekly_disposable_income}`);
