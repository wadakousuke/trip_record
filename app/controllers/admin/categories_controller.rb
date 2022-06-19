class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def edit
  end
end
