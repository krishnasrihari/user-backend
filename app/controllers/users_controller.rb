class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :create_friend]

  # GET /users
  def index
    @users = User.all

    render jsonapi: @users
  end

  # GET /users/1
  def show
    render jsonapi: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render jsonapi: @user, status: :created, location: @user 
    else
      render jsonapi: @user.errors , status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      
      render jsonapi: @user
    else
      render jsonapi: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def create_friend
    @friend = User.new(user_params)

    if @friend.save
      @user.friendships.create(friend: @friend)
      render jsonapi: @friend, status: :created, location: @friend
    else
      render jsonapi: @friend.errors , status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:first_name, :last_name] )
    end

end
