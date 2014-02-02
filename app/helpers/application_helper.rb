module ApplicationHelper
  def four_year(value,growth=0.038)
    value+value*(1+growth)+(value)*(1+growth)**2+(value)*(1+growth)**3
  end
end
