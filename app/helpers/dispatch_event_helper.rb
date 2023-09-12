# frozen_string_literal: true

module DispatchEventHelper
  def dispatch_event(name)
    turbo_stream_action_tag :dispatch_event, name:
  end
end

Turbo::Streams::TagBuilder.prepend(DispatchEventHelper)
