class Api::MonstersController < ApplicationController
  # before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  def index
    if current_user
      @monsters = Monster.where(user_id: current_user.id)
      render 'index.json.jb'
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    if current_user && Monster.find_by(id: params[:id], user_id: current_user.id)
      @monster = Monster.find_by(id: params[:id], user_id: current_user.id)
      render 'show.json.jb'
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    if current_user
      @monster = Monster.create(
        {
          top_text: params[:top_text],
          bottom_text: params[:bottom_text],
          head_url: params[:head_url],
          body_url: params[:body_url],
          leg_url: params[:leg_url],
          user_id: current_user.id
        }
      )
      render 'show.json.jb'
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    if current_user && Monster.find_by(id: params[:id], user_id: current_user.id)
      @monster = Monster.find_by(id: params[:id])
      @monster.top_text = params[:top_text] || @monster.top_text
      @monster.bottom_text = params[:bottom_text] || @monster.bottom_text
      @monster.head_url = params[:head_url] || @monster.head_url
      @monster.body_url = params[:body_url] || @monster.body_url
      @monster.leg_url = params[:leg_url] || @monster.leg_url
      if @monster.save
        render 'show.json.jb'
      else
        render json: {message: "Monster was not updated"}
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user && Monster.find_by(id: params[:id], user_id: current_user.id)
      @monster = Monster.find_by(id: params[:id])
      @monster.destroy
      render json: {message: "The monster has been deleted"}
    else
      render json: {}, status: :unauthorized
    end
  end
end
