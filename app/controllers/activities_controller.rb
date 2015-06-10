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

  def newActivity
    params.delete :controller
    params.delete :action
    model = params["model"] + ".new"
    params.delete :model

    activity = eval(model)

    params.each do |key, value|
      activity[key] = value
    end

    if activity.valid?
      activity.save
      render json: {"success":true}
    else
      render json: {"success":false}
    end
  end

end
