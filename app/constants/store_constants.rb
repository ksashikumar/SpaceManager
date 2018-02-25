module StoreConstants
  PAGINATION_FIELDS = %i[page limit].freeze
  CREATE_FIELDS = %i[title city street spaces_count].freeze
  UPDATE_FIELDS = %i[id title city street spaces_count].freeze
  INDEX_FIELDS  = %i[id title city street spaces_count created_at updated_at].freeze | PAGINATION_FIELDS
  FILTER_ATTRIBUTE_TYPES = {
    id: 'integer', title: 'string', city: 'string', street: 'string',
    spaces_count: 'integer', created_at: 'date_time', updated_at: 'date_time'
  }.freeze
  FILTER_ATTRIBUTES = FILTER_ATTRIBUTE_TYPES.keys
end.freeze
