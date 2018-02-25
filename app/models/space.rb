class Space < ApplicationRecord
  include FilterParser
  belongs_to :store

  def get_price_quote(start_date, end_date)
    num_days = number_of_days(start_date, end_date)
    num_months = num_weeks = 0
    if num_days > 30
      num_months = number_of_months(num_days)
      num_days -= (30 * num_months)
    end
    if num_days > 7
      num_weeks = number_of_weeks(num_days)
      num_days -= (7 * num_weeks)
    end
    (price_per_month * num_months) + (price_per_week * num_weeks) + (price_per_day * num_days)
  end

  private

  def number_of_days(start_date, end_date)
    (end_date - start_date).to_i
  end

  def number_of_months(num_days)
    num_days / 30
  end

  def number_of_weeks(num_days)
    num_days / 7
  end
end
