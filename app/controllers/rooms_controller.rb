class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @note = Note.all
  end
end
