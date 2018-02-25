class ApplicationController < ActionController::API
  attr_accessor :cname_params
  include FilterParser

  rescue_from ActionController::UnpermittedParameters, with: :render_unpermitted_params

  before_action :validate_params, only: %i[create update price_filter]
  before_action :validate_filter_params, only: :index
  before_action :load_object,  only: %i[show update destroy]
  before_action :load_objects, only: :index
  before_action :build_object, only: :create

  def render_errors(status = 400)
    render(json: @item.errors, status: status)
  end

  def render_400(field, message)
    render(json: { field: field, message: message }, status: 400)
  end

  def render_404(field)
    render(json: { field: field, value: params[field], message: 'Given resource not found' }, status: 404)
  end

  def render_unpermitted_params
    render(json: { message: "Unpermitted params found in request. Permitted params: #{allowed_params}" }, status: 400)
  end

  def render_item(root_key = cname)
    render(json: @item, status: 200, root: root_key)
  end

  def render_items(root_key = cname.pluralize)
    render(json: @items, status: 200, root: root_key, meta: count_meta_hash)
  end

  def render_201
    render(nothing: true, status: 201)
  end

  def render_500
    render(json: { message: 'Something went wrong in the server' }, status: 500)
  end

  def validate_params
    @cname_params = 
      params[cname].present? ? params.require(cname).permit(*allowed_params) : params.permit(*allowed_params)
  end

  def validate_filter_params
    @cname_params = params.permit(*allowed_params)
    filter_params_arr = []
    @cname_params.each do |key, val|
      if val.include?(':')
        operator, value = val.split(':', 2).map(&:squish)
        filter_params_arr << { field: key.to_sym, operator: operator.to_sym, value: value }
      end
    end
    render_400('filter_param', 'Invalid query param') unless filter_params_arr.blank? || valid_filters?(filter_params_arr)
  end

  protected

  def cname
    @cname ||= controller_name.singularize
  end

  def count_meta_hash
    {
      count: @items.total_count
    }
  end
end
