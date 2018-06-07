class LineItemProductsController < ApplicationController
  skip_before_action :authorize, only: :cretae
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item_product, only: [:show, :edit, :update, :destroy]

  # GET /line_item_products
  # GET /line_item_products.json
  def index
    @productsonsales = Productsonsale.all
    @line_item_products = LineItemProduct.all
  end

  # GET /line_item_products/1
  # GET /line_item_products/1.json
  def show
    @line_item_products = LineItemProduct.all
  end

  # GET /line_item_products/new
  def new
    @line_item_product = LineItemProduct.new
  end

  # GET /line_item_products/1/edit
  def edit
  end

  # POST /line_item_products
  # POST /line_item_products.json
  def create
    productsonsale = Productsonsale.find(params[:productsonsale_id])
    @line_item_product = @cart.add_productsonsale(productsonsale)

    respond_to do |format|
      if @line_item_product.save
        session[:counter] = nil
        format.html { redirect_to store_products_index_url }
        format.js { @current_item = @line_item_product }
        format.json { render :show, status: :created, location: @line_item_product }
      else
        format.html { render :new }
        format.json { render json: @line_item_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_item_products/1
  # PATCH/PUT /line_item_products/1.json
  def update
    respond_to do |format|
      if @line_item_product.update(line_item_product_params)
        format.html { redirect_to @line_item_product, notice: 'Line item product was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item_product }
      else
        format.html { render :edit }
        format.json { render json: @line_item_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def reduce
    @cart = current_cart
    @line_item_product = @cart.reduce(params[:id])

    respond_to do |format|
      if @line_item_product.save
        format.html { redirect_to store_products_path, notice: 'Line item was successfully updated.' }
        format.js   { @current_item = @line_item_product }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def add
    @cart = current_cart
    @line_item_product = @cart.add(params[:id])

    respond_to do |format|
      if @line_item_product.save
        format.html { redirect_to store_products_path, notice: 'Line item was successfully updated.' }
        format.js   { @current_item = @line_item_product }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item_product.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /line_item_products/1
  # DELETE /line_item_products/1.json
  def destroy
    @line_item_product.destroy
    respond_to do |format|
      format.html { redirect_to line_item_products_url, notice: 'Line item product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item_product
      @line_item_product = LineItemProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_product_params
      params.require(:line_item_product).permit(:productsonsale_id)
    end
end
