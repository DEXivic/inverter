require "mongoid_slug"
require "mongoid-history"
require "history_tracker"

require "inverter/concerns/inverter"
require "inverter/object"
require "inverter/controller_helper"
require "inverter/configuration"
require "inverter/parser"
require "inverter/version"
require "inverter/engine"
require "inverter/template_renderer_helper"

module Inverter
  extend Configuration
  extend Object
end

require "meta_tags"

ActionController::Base.send :include, Inverter::ControllerHelper
ActionView::TemplateRenderer.send :include, Inverter::TemplateRendererHelper