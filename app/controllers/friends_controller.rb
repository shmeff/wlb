class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all

    flash.now[:notice] = "fun fun fun "

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render json: @friend, status: :created, location: @friend }
      else
        format.html { render action: "new" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def friend_params
      params.require(:friend).permit(:name, :degree, :last_seend)
    end
end
