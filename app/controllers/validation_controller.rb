class ValidationController < ApplicationController
  def check
    model_name = params[:model]
    model_const = Kernel.const_get(model_name)
    model_args = model_params(model_name, model_const)
    model_instance = model_const.new(model_args)
    model_instance.valid?

    model_errors = model_instance.errors.to_h

    model_attributes = model_columns_symbolized(model_const)

    respond_to do |format|
      format.json {
        render json: {
          errors: model_errors
        }
      }
    end
  end

  private

  def model_columns_symbolized(model_const)
    model_const.column_names.map(&:to_sym)
  end

  def model_params(model_name, model_const)
    model_name_sym = model_name.downcase.to_sym
    model_attr_syms = model_columns_symbolized(model_const)
    params.require(model_name_sym).permit(model_attr_syms)
  end
end
