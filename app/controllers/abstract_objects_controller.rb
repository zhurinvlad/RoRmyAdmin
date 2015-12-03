class AbstractObjectsController < ApplicationController
  inherit_resources
  defaults :instance_name => 'abstract_object'

  before_filter :setup_class

  def create
    create!{schema_path(@db_connects, name: @name)}
  end

  def update
    update!{schema_path(@db_connects, name: @name)}
  end

  def destroy
    destroy!{schema_path(@db_connects, name: @name)}
  end

  private

  def setup_class
    @db_connects = DbConnect.find(params[:connection_id])
    @schema = Schema.new(@db_connects.config)
    @name = params[:name]
    @model_name = @name.humanize
    self.class.resource_class = @schema.get_schemas[@name]
  end
end
