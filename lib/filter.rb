class Filter
  attr_accessor :operator, :field, :value, :type

  OPERATOR_MAP = { eq: '=', like: 'ilike', gt: '>', lt: '<' }.freeze

  def initialize(filter_param)
    @field = filter_param[:field]
    @type = filter_param[:type]
    @operator = filter_param[:operator]
    @value = filter_param[:value]
  end

  def valid?
    valid_operator? && valid_filter_type? && valid_value?
  end

  def to_condition_str
    if operator == :like
      "#{field} #{OPERATOR_MAP[operator]} '%#{value}%'"
    else
      "#{field} #{OPERATOR_MAP[operator]} '#{value}'"
    end
  end

  private

  def valid_filter_type?
    if type == 'string'
      %i[eq like].include?(operator)
    else # float, integer, Date, Time
      %i[eq gt lt].include?(operator)
    end
  end

  def valid_operator?
    OPERATOR_MAP.keys.include?(operator)
  end

  def valid_value?
    @value = DateTime.parse(@value) if type == 'date_time'
    true
  rescue ArgumentError
    false
  end
end
