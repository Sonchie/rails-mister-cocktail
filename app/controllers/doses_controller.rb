class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose = @cocktail.doses.new(dose_params)
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
