class Note < ApplicationRecord
  belongs_to :user
  after_create_commit { BroadcastNoteJob.perform_later self}

end
