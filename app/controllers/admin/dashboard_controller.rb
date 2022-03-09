class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], only: [:admin]

  def show
  end
end
