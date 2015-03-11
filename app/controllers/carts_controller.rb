class CartsController < ApplicationController 
  before_action :set_cart, only: [:show, :edit, :update, :destroy ]
  load_and_authorize_resource
  
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show 
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def push 
    cart     = Cart.find(params[:user_id])
    item     = Item.find(params[:item_id]) 
    position = Position.find_by_item_id(item.id)
    if cart.items.exists?(item.id)
      position.quantity += 1
      position.save
    else
      Position.create(cart_id: cart.id,item_id: item.id, quantity: 1) 
    end
    redirect_to :back, notice: "Item was added to Your cart"
  end


  def pull 
    cart = Cart.find(params[:cart_id]) 
    cart.items.delete(params[:item_id]) 
    redirect_to :back
  end 

  def submit_cart
    cart    = Cart.find(params[:cart_id]) 
    history = History.find(params[:cart_id])
    cart.positions.each do |position| 
      item = Item.find(position.item_id)
      history.item_records.create(name: item.name, price: item.price, quantity: position.quantity) 
      Position.delete(position)     
    end

    redirect_to :back, notice: "Successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
