class SemesterPackage < ActiveRecord::Base
  belongs_to :student

  def coa
    tuition_and_fees+housing_meals+books+transportation+other
  end

  def net_cost
    coa - (school_grant+pell+state_grant+other_scholarship)
  end

  def grants_scholarships
    school_grant + pell + state_grant + other_scholarship
  end

  def total_sub_loans
    perkins + sub_stafford + unsub_stafford
  end

  def family_contribution
    net_cost - (work_study+perkins+sub_stafford+unsub_stafford)
  end

  def unmet_need
    net_cost - (work_study + total_sub_loans + family_contribution)
  end

  def my_coa
    tuition_and_fees+(my_housing||0)+(my_books||0)+(my_transportation||0)+(my_other||0)
  end

  def my_net_cost
    my_coa - ((school_grant||0)+(pell||0)+(state_grant||0)+(my_other_scholarship||0))
  end

  def my_unmet_need
    my_net_cost - ((my_work_study||0) + (total_sub_loans||0) + (my_family_contribution||0))
  end


  def set_my_variables
    self.update_attributes(my_housing: housing_meals,
                            my_books: books,
                            my_transportation: transportation,
                            my_other: other,
                            my_other_scholarship: other_scholarship,
                            my_work_study: work_study,
                            my_family_contribution: family_contribution)
  end

  def coa_4
    four_year(tuition_and_fees)+four_year(housing_meals)+four_year(books)+four_year(transportation)+four_year(other)
  end

  def my_coa_4
    four_year(tuition_and_fees)+(four_year(my_housing||0))+four_year(my_books||0)+four_year(my_transportation||0)+four_year(my_other||0)
  end

  def net_cost_4
    coa_4 - (four_year(school_grant)+(pell+state_grant+other_scholarship)*4)
  end

  def my_net_cost_4
    my_coa_4 - (four_year(school_grant)+(pell+state_grant+other_scholarship)*4)
  end

  def total_sub_loans_4
    (perkins + sub_stafford + unsub_stafford)*4
  end

  def unmet_need_4 
    net_cost_4 - (total_sub_loans_4 + work_study*4 + family_contribution*4)
  end

  def my_unmet_need_4
    my_net_cost_4 - (total_sub_loans_4 + my_work_study*4 + my_family_contribution*4)
  end

  def private_loan_interest
    0.0325*unmet_need_4
  end

  def my_private_loan_interest
    0.0325*my_unmet_need_4
  end

  def four_year(value,growth=0.038)
    value+value*(1+growth)+(value)*(1+growth)**2+(value)*(1+growth)**3
  end

  def perkins_accrued
    (four_year(perkins,0.05)-perkins*4)
  end

  def stafford_accrued
    (four_year(unsub_stafford,0.0386)-unsub_stafford*4)
  end

  def public_interest
    perkins_accrued + stafford_accrued
  end

  def debt_balance
    unmet_need_4 + private_loan_interest + total_sub_loans_4 + public_interest
  end

  def my_debt_balance
    my_unmet_need_4 + my_private_loan_interest + total_sub_loans_4 + public_interest
  end

  def monthly_payment(years)
    calc_monthly_payment(perkins*4+perkins_accrued, 0.05, years) + 
    calc_monthly_payment(unsub_stafford*4+stafford_accrued+sub_stafford*4, 0.0386,years) +
    calc_monthly_payment(unmet_need_4 + private_loan_interest, 0.065, years)
  end

  def my_monthly_payment(years)
    calc_monthly_payment(perkins*4+perkins_accrued, 0.05, years) + 
    calc_monthly_payment(unsub_stafford*4+stafford_accrued+sub_stafford*4, 0.0386,years) +
    calc_monthly_payment(my_unmet_need_4 + my_private_loan_interest, 0.065, years)
  end

  def calc_monthly_payment(principal, rate, years)
    i = rate/12
    n = years*12
    (i*principal*(1+i)**n)/(((1+i)**n)-1)
  end


end
