class SpacesController < ApplicationController
  before_action :sanitize_date_params, :load_object, only: :price_filter

  def create
    if @item.save
      render_item
    else
      render_errors
    end
  end

  def update
    if @item.update_attributes(cname_params)
      render_item
    else
      render_errors(@item)
    end
  end

  def destroy
    if @item.destroy
      head 204
    else
      render_errors(@item)
    end
  end

  def show
    render_item
  end

  def index
    render_items
  end

  def price_filter
    start_date = cname_params[:start_date]
    end_date = cname_params[:end_date]
    render(json: { price_quote: @item.get_price_quote(start_date, end_date) })
  end

  private

  def load_object
    @item = Space.find_by_id(params[:id])
    render_404('id') unless @item
  end

  def load_objects
    @items = Space.preload(:store).where(where_query).page(params[:page] || 1).per(params[:limit] || 10)
  end

  def build_object
    @store = Store.find_by_id(cname_params[:store_id])
    return render_404('store_id') unless @store
    @item = @store.spaces.build(cname_params)
  end

  def sanitize_date_params
    cname_params[:start_date] = Date.parse(cname_params[:start_date])
    cname_params[:end_date] = Date.parse(cname_params[:end_date])
  rescue ArgumentError
    render_400('date_params', 'Not a valid date')
  end

  def allowed_params
    "SpaceConstants::#{action_name.upcase}_FIELDS".constantize
  end

  def constant_class
    SpaceConstants
  end
end
