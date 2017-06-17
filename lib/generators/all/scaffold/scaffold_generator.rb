require 'rails/generators/erb'
require 'rails/generators/resource_helpers'

module All # :nodoc:
  # class ScaffoldGenerator < Erb::Generators::Base # :nodoc:
  class ScaffoldGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers

    # source_root File.expand_path("./lib/templates/erb/scaffold", Rails.root)
    source_root Rails.root.join('lib', 'templates', 'erb', 'scaffold')

    argument :attributes, type: :array, default: [], banner: 'field:type field:type'

    def create_root_folder
      empty_directory File.join('app/views', controller_file_path)
    end

    def copy_view_files
      available_views.each do |view|
        # formats.each do |format|
        #   filename = filename_with_extensions(view, format)
        #   template filename, File.join('app/views', controller_file_path, filename)
        # end
        template view, File.join("app/views", controller_file_path, view)
      end
    end

    def create_search_model_file
      template '../models/forms/search_model.rb.erb', "app/models/forms/#{file_name}_search.rb"
    end

    def add_serach_route
      route "post '#{plural_table_name}/search'"
    end

  protected

    def available_views
      # %w(index edit show new _form)
      # use all template files contained in source_root ie 'lib/templates/scaffold/**/*'
      base = Rails.root.join('lib', 'templates', 'erb', 'scaffold')
      base_len = base.to_path.length
      Dir.glob("#{base.to_path}/*").select { |f| File.file?(f) }.map { |f| f.split(File::SEPARATOR).last }
    end
  end
end
