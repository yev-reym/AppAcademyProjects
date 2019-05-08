require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req 
    @res = res 
    @already_built_response = false 
  end

  # Helper method to alias @already_built_response
  def already_built_response?
      @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Double Render Error!" if already_built_response?
    @already_built_response = true
    @res.status = 302
    @res.set_header('Location', url)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
      raise "Double Render Error!" if already_built_response?
      @already_built_response = true
      @res['Content-Type'] = content_type
      @res.write(content)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    # self.class = UsersController
    controller_name_camel_case = self.class.to_s.underscore
    template_path = "views/#{controller_name_camel_case}/#{template_name}.html.erb"
    template = ERB.new(File.read(template_path))
    render_content(template.result(binding),'text/html')
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

