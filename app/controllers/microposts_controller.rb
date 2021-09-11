# frozen_string_literal: true
class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]

  # GET /microposts or /microposts.json
  def index
    @user = User.find(params[:user_id])
    @microposts = @user.microposts.find(:id)
  end

  # GET /microposts/1 or /microposts/1.json
  def show; end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit; end

  # POST /microposts or /microposts.json
  # @return [Object]
  def create
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(params[:comment].permit(:name, :comment))
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.create(params[:micropost].permit(:content, :id))
    # redirect_to user_micropost_url
    # respond_to do |format|
    #   if @micropost.save
    #     format.html { redirect_to micr, notice: 'Micropost was successfully created.' }
    #     format.json { render :show, status: :created, location: @micropost }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @micropost.errors, status: :unprocessable_entity }
    #   end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to user_microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  end

  # # PATCH/PUT /microposts/1 or /microposts/1.json
  # def update
  #   respond_to do |format|
  #     if @micropost.update(micropost_params)
  #       format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @micropost }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @micropost.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

 

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_micropost
  #     @micropost = Micropost.find(params[:id])
  #   end
  #
  #   # Only allow a list of trusted parameters through.
  #   def micropost_params
  #     params.require(:micropost).permit(:content, :user_id)
  #   end

