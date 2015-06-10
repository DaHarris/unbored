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
      render json: {"success": "true", "name":activity.name, "lat":activity.lat,
                    "long":activity.long, "icon":activity.icon}
    else
      render json: {"success": "false"}
    end
  end

  def getAllActivities
    tables = ActiveRecord::Base.connection.tables.map(&:singularize)
    models = tables.map{|model| model.capitalize + ".all"}
    models.delete("Schema_migration.all")
    activities = []
    models.each do |model|
      activities << eval(model)
    end
    activities = activities.flatten
    render json: activities
  end

  def getActivity
    url = request.env["HTTP_REFERER"]
    if url == "http://foodtruckin.herokuapp.com/" || url == "http://localhost:3000/"
      model = params["model"] + ".all"
      render json: eval(model)
    end
  end

end
