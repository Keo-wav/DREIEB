class DrugsController < ApplicationController
  # before_action :set_drug, only: %I[update destroy]

  def index
    @drugs = Drug.all
  end

  def show
    @drug = Drug.find(params[:id])
  end

  def new
    @drug = Drug.new
  end

  def create
    @drug = Drug.new(drug_params)
    @drug.user = current_user
    if @drug.save
      redirect_to drug_path(@drug)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @drug = Drug.find(params[:id])
  end

  def update
    @drug = Drug.find(params[:id])
    @drug.update(drug_params)
    redirect_to drug_path(@drug)
  end

  def destroy
    @drug = Drug.find(params[:id])
    @drug.destroy
    redirect_to drugs_path, status: :see_other
  end

  private

  # def set_drug
  #   @drug = Drug.find(params[:id])
  # end

  def drug_params
    params.require(:drug).permit(:name, :price, :description, :category, :delivery_time)
  end
end
