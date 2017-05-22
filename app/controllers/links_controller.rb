class LinksController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    else
    end
  end
end
