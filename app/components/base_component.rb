# frozen_string_literal: true

# Base component.
class BaseComponent < ViewComponent::Base
  def set_component_attributes(**kwargs)
    @title = kwargs[:title]
    @variant = kwargs[:variant] || :info
    @dismissible = kwargs[:dismissible] || false
    @data = kwargs[:data] || {}
    @classes = kwargs[:classes] || []
    @id = kwargs[:id]
    @role = kwargs[:role] || 'alert'
  end

  # Merge classes together.
  #
  # @param args [Array<String>, String] The classes to merge (array, classes, space separated classes).
  # @return [String] The merged classes.
  def merge_classes(*)
    ComponentSupport::CssClasses.merge(*)
  end

  # Merge data-actions together.
  #
  # @param args [Array<String>, String] The actions to merge (array, classes, space separated classes).
  # @return [String] The merged classes.
  def merge_actions(*)
    ComponentSupport::CssClasses.merge(*)
  end
end
