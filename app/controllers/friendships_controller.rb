class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :destroy]

  # GET /friendships
  def index
    @friendships = Friendship.all

    render jsonapi: @friendships
  end

  # GET /friendships/1
  def show
    render jsonapi: @friendship
  end

  # POST /friendships
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      render jsonapi: @friendship, status: :created, location: @friendship 
    else
      render jsonapi: @friendship.errors , status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friendships/1
  def update
    if @friendship.update(friendship_params)
      render jsonapi: @friendship
    else
      render jsonapi: @friendship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friendship_params
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:user_id,:friend_id] )
    end

end
