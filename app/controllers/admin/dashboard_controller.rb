class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ["Jungle"], password: ENV["book"], only: [:admin]

  def show
  end
end
