class StoresController < ApplicationController
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

  private

  def load_object
    @item = Store.find_by_id(params[:id])
    render_404('id') unless @item
  end

  def load_objects
    @items = Store.where(where_query).page(params[:page] || 1).per(params[:limit] || 10)
  end

  def build_object
    @item = Store.new(cname_params)
  end

  def allowed_params
    "StoreConstants::#{action_name.upcase}_FIELDS".constantize
  end

  def constant_class
    StoreConstants
  end
end
