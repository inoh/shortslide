module ApplicationHelper
  def error_class(model, name)
    if model.errors[name].any?
      "has-error"
    end
  end
end
