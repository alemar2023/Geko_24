class CategoriesI18nsController < ApplicationController
  before_action :set_category
  before_action :set_categories_i18n, only: %i[ show edit update destroy ]

  # GET /categories_i18ns or /categories_i18ns.json
  def index
    @categories_i18ns = CategoriesI18n.all
  end

  # GET /categories_i18ns/1 or /categories_i18ns/1.json
  def show
  end

  # GET /categories_i18ns/new
  def new
    @categories_i18n = CategoriesI18n.new
  end

  # GET /categories_i18ns/1/edit
  def edit
  end

  # POST /categories_i18ns or /categories_i18ns.json
  def create
    @categories_i18n = CategoriesI18n.new(categories_i18n_params)
    respond_to do |format|
      if @categories_i18n.save
        format.html { redirect_to categor_url(@category), notice: "Categories i18n was successfully created." }
        format.json { render :show, status: :created, location: @categories_i18n }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categories_i18n.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_i18ns/1 or /categories_i18ns/1.json
  def update
    respond_to do |format|
      if @categories_i18n.update(categories_i18n_params)
        format.html { redirect_to categories_i18n_url(@categories_i18n), notice: "Categories i18n was successfully updated." }
        format.json { render :show, status: :ok, location: @categories_i18n }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categories_i18n.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_i18ns/1 or /categories_i18ns/1.json
  def destroy
    @categories_i18n.destroy!

    respond_to do |format|
      format.html { redirect_to categories_i18ns_url, notice: "Categories i18n was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_categories_i18n
    @categories_i18n = CategoriesI18n.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def categories_i18n_params
    params.require(:categories_i18n).permit(:category_id, :name, :locale, :description, :description_extra)
  end
end
