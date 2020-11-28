class Api::MemesController < ApplicationController
  def index
    @memes = Meme.all
    render 'index.json.jb'
  end

  def create
    @meme = Meme.create(
      {
        top_text: params[:top_text],
        bottom_text: params[:bottom_text],
        img_url: params[:img_url],
        user_id: 1
      }
    )
    render 'show.json.jb'
  end
end
