class LinksController < ApplicationController

  def new
  end


  def index
    if !current_user
      redirect_to login_path
    else
    @link = Link.new
    end
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to root_path
    else
      flash.now[:error] = @link.errors.full_messages.join('. ')
      render :index
    end
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
