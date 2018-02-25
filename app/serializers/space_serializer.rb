class SpaceSerializer < BaseSerializer
  attributes :id, :title, :size, :price_per_day, :price_per_week, :price_per_month
  belongs_to :store, serializer: StoreSerializer
end
