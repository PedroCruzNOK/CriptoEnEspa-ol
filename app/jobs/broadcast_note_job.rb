class BroadcastNoteJob < ApplicationJob
  queue_as :default

  def perform(note)
    ActionCable.server.broadcast 'room_channel', render_note(note)
    # Do something later
  end
  private
  def render_note(note)
    ApplicationController.renderer.render note
  end
end
