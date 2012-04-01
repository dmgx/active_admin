require 'active_admin/component'

module ActiveAdmin
  module BatchActions

    # Build an BatchActionForm
    class BatchActionForm < ActiveAdmin::Component
      builder_method :batch_action_form

      attr_reader :prefix_html

      def build(options = {}, &block)
        options[:id] ||= "collection_selection"
        @prefix_html = with_output_buffer do
          text_node(form_tag batch_action_path, :id => options[:id])
        end
        super(options)
        add_child text_node(hidden_field_tag :batch_action)
      end

      # Override to_html to wrap the custom form stuff
      def to_s
        html = @prefix_html + content
        html += raw '</form>'
      end

      def add_child(child)
        if @contents
          @contents << child
        else
          super
        end
      end

    end
  end
end
