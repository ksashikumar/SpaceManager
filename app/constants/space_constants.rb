module SpaceConstants
  PAGINATION_FIELDS = %i[page limit].freeze
  CREATE_FIELDS = %i[title size price_per_day price_per_week price_per_month store_id].freeze
  UPDATE_FIELDS = %i[id title size price_per_day price_per_week price_per_month].freeze
  INDEX_FIELDS  = %i[id title size price_per_day price_per_week
                     price_per_month store_title created_at updated_at].freeze | PAGINATION_FIELDS
  PRICE_FILTER_FIELDS = %i[id start_date end_date].freeze
  FILTER_ATTRIBUTE_TYPES = {
    id: 'integer', title: 'string', size: 'float', price_per_day: 'float',
    price_per_week: 'float', price_per_month: 'float', created_at: 'date_time', updated_at: 'date_time'
  }.freeze
  FILTER_ATTRIBUTES = FILTER_ATTRIBUTE_TYPES.keys
end.freeze
