class Api::V1::LinksController < ApplicationController

  def create
    link = current_user.links.new(new_links_params)
    
    if link.save
      render partial: "links/all_links", locals: {link: link}, layout: false
    else
      render json: link.errors.full_messages, status: 400
    end
  end


  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end

  def new_links_params
    params.permit(:url, :title)
  end
end
