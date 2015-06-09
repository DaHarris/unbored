class ActivitiesController < ApplicationController

  def getFormInfo
    hash = {}
    model = eval(params["model"])
    attributes = model.attribute_names
    attributes.each do |attr|
      if attr == "id" || attr == "icon"
        next
      end
      type = model.column_for_attribute(attr).type
      hash[attr] = type
    end
    render json: hash
  end

end
