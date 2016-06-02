class DosesController < ApplicationController
  def show
    @dose = dose.find(params[:id])
  end

  def new
    p params
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
