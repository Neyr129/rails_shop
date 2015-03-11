class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @rating = Rating.where(item_id: @item.id, user_id:  current_user.id).first 
    unless @rating 
      @rating = Rating.create(item_id: @item.id, user_id:  current_user.id, score: 0)
    end
  end

  # GET /items/new
  def new
    @item = Item.new
    @image = @item.images.new
  end

  def example 
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create 
    @item = current_user.items.new(item_params)
    # @item.user_id = current_user.id
    @image = @item.images.new(image_params) if !image_params.nil?
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if !params[:item].nil? 
      @image = @item.images.new(image_params) 
      if check_user_id(current_user, @item) 
        respond_to do |format|
          if @item.update(item_params)
            format.html { redirect_to @item, notice: 'Item was successfully updated.' }
            format.json { render :show, status: :ok, location: @item }
            format.html { render :edit }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      else 
        redirect_to :items, notice: 'Yor are not allowed to update this item'
      end
    else
      respond_to do |format|
       format.html {redirect_to @item , notice: 'photo is not chosen' }
      end
    end
  end

  def add_image 
    @item = Item.find(params[:format])
    @image= @item.images.new
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item].permit(:name, :price, :stars)
    end

    def image_params
      params[:item][:image].permit(:img) if !params[:item][:image].nil?
    end

    def check_user_id(user, item)
      item.user_id == user.id
    end
end
