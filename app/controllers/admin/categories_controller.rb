class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
  end
end
