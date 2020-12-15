class Api::MemesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @memes = Meme.where(user_id: current_user.id)
      render 'index.json.jb'
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    @meme = Meme.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    if current_user
      @meme = Meme.create(
        {
          top_text: params[:top_text],
          bottom_text: params[:bottom_text],
          img_url: params[:img_url],
          user_id: current_user.id
        }
      )
      render 'show.json.jb'
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    @meme = Meme.find_by(id: params[:id])
    @meme.top_text = params[:top_text] || @meme.top_text
    @meme.bottom_text = params[:bottom_text] || @meme.bottom_text
    @meme.img_url = params[:img_url] || @meme.img_url
    if @meme.save
      render 'show.json.jb'
    else
      render json: {message: "Meme was not updated"}
    end
  end

  def destroy
    @meme = Meme.find_by(id: params[:id])
    @meme.destroy
    render json: {message: "The meme has been deleted"}
  end
end
