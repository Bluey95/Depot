class ProductsonsalesController < ApplicationController
  before_action :set_productsonsale, only: [:show, :edit, :update, :destroy]

  # GET /productsonsales
  # GET /productsonsales.json
  def index
    @productsonsales = Productsonsale.all
     if params[:search]
    @productsonsales = Productsonsale.search(params[:search]).order("title")
  else
    @productsonsales = Productsonsale.all.order('created_at DESC')
  end
  end

  # GET /productsonsales/1
  # GET /productsonsales/1.json
  def show
    @productsonsales = Productsonsale.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productsonsale }
    end
  end

  # GET /productsonsales/new
  def new
    @productsonsale = Productsonsale.new
  end

  # GET /productsonsales/1/edit
  def edit
  end

  # POST /productsonsales
  # POST /productsonsales.json
  def create
    @productsonsale = Productsonsale.new(productsonsale_params)

    respond_to do |format|
      if @productsonsale.save
        format.html { redirect_to @productsonsale, notice: 'Productsonsale was successfully created.' }
        format.json { render :show, status: :created, location: @productsonsale }
      else
        format.html { render :new }
        format.json { render json: @productsonsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productsonsales/1
  # PATCH/PUT /productsonsales/1.json
  def update
    respond_to do |format|
      if @productsonsale.update(productsonsale_params)
        format.html { redirect_to @productsonsale, notice: 'Productsonsale was successfully updated.' }
        format.json { render :show, status: :ok, location: @productsonsale }
        
        @productsonsales = Productsonsale.all? 
        ActionCable.server.broadcast 'productsonsales',
        html: render_to_string('store_products/index', layout: false)
        
      else
        format.html { render :edit }
        format.json { render json: @productsonsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productsonsales/1
  # DELETE /productsonsales/1.json
  def destroy
    @productsonsale.destroy
    respond_to do |format|
      format.html { redirect_to productsonsales_url, notice: 'Productsonsale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought
    @productsonsale = Productsonsale.find(params[:id])
    @latest_order = @productsonsale.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
      format.atom
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productsonsale
      @productsonsale = Productsonsale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productsonsale_params
      params.require(:productsonsale).permit(:title, :description, :image_url, :price)
    end
end
