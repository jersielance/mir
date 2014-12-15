class MainController < ApplicationController
  skip_before_filter :require_login
  def index
  end

  def services
  end

  def contacts
  end
end
