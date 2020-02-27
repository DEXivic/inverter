module Inverter
  module ControllerHelper
    extend ActiveSupport::Concern

    included do
      alias_method :render, :render_with_inverter_object
    end


    def render_with_inverter_object(*args, &block)
      # reset Inveter.object to nil
      Inverter.reset_object()

      # make a pointer to meta_tags for future use
      Inverter.set_meta_tags(meta_tags)

      # Call regular render method, this calls custom template rendered which
      # idetifies if there is an inverter object for the template
      render_without_inverter_object(*args, &block)

      # modify response only if Inverter.object is set
      if Inverter.object
        self.response_body[0] = Inverter.object.update_html(self.response_body[0])
      end

      if self.request.format.html?
        self.response_body[0] = Inverter::Tags.update_html(self.response_body[0])
      end
    end
    protected :render_with_inverter_object

  end
end
