class ActivitiesController < ApplicationController

  def getFormInfo
    hash = {}
    modelName = params["model"].capitalize
    model = modelName.constantize.new
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
    model = params["model"].capitalize
    params.delete :model

    activity = model.constantize.new

    params.each do |key, value|
      activity[key] = value
    end

    if activity.valid?
      activity.save
      render json: {"success" => "true", "name" => activity.name, "lat" => activity.lat,
                    "long" => activity.long, "icon" => activity.icon}
    else
      render json: {"success" => "false"}
    end
  end

  def getAllActivities
    tables = ActiveRecord::Base.connection.tables.map(&:singularize)
    models = tables.map{|model| model.capitalize}
    models.delete("Schema_migration")
    activities = []
    models.each do |model|
      activities << model.constantize.all
    end
    activities = activities.flatten
    render json: activities
  end

  def getActivity
    url = request.env["HTTP_REFERER"]
    if url == "http://un-bored.herokuapp.com/"
      if params["model"] =~ /user/i
        render json: {error: "uh uh uhhhh, you didn't say the magic word..."}
      else
        render json: params["model"].capitalize.constantize.all
      end
    end
  end

end
