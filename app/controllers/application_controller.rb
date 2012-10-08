class ApplicationController < ActionController::Base
  protect_from_forgery
  # Class method
  def self.search_action_for(table, options={})
    table = table.to_s
    # Look up the constant by name, somehow
    model_class = table.classify.constantize
    # Pass a block to define_method, to set up the method in the controller
    define_method(:search) do
      @title = options[:title] || "Your #{table.humanize}"
      # Allow overriding of the search column
      search_column = options[:search_column] || 'model_name'
      @display_as = options[:display_as] || :model_name
      @display_path = options[:display_path] || "#{table.singularize}_path"
      @results = model_class.where("#{search_column} like ?", "%#{params[:term]}%")
      render 'shared/search_results'
    end
  end
end
