module FilterParser
  def where_query
    (@filters_list || []).map(&:to_condition_str).join(' AND ')
  end

  def valid_filters?(filters)
    (filters.map { |filter| filter[:field] } - constant_class.const_get('FILTER_ATTRIBUTES')).empty? &&
      get_filters_list(filters).map(&:valid?).all?
  end

  def get_filters_list(filters)
    @filters_list ||= filters.map do |filter|
      Filter.new(
        field: filter[:field], operator: filter[:operator],
        value: filter[:value], type: constant_class.const_get('FILTER_ATTRIBUTE_TYPES')[filter[:field]]
      )
    end
  end
end
