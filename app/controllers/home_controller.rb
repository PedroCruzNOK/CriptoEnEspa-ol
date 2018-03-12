class HomeController < ApplicationController
  # load_and_authorize
  skip_authorization_check only: [:index]
  before_action :authenticate_user!, only: [:my_home]

  def index
  end

  def my_home
  end
end
