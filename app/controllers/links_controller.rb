class LinksController < ApplicationController
  before_action :get_link, only: [:update, :edit]
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
      flash[:error] = @link.errors.full_messages.join('. ')
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      flash[:success] = "Link has been updated!"
      redirect_to root_path
    else
      flash[:error] = @link.errors.full_messages.join('.')
      render :edit
    end
  end

private
  def link_params
    params.require(:link).permit(:url, :title)
  end

  def get_link
    @link = current_user.links.find_by_id(params[:id])
  end
end
