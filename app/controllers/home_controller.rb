class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:my_home]
  def index

  end

  def my_home
    
  end
end
