class FranchisesController < ApplicationController
  def new
    @franchise = Franchise.new
  end

  def create
    @franchise = Franchise.new(franchise_params)

    @franchise.save
  end
  
  def index
    
  end

  private

  def franchise_params
    params.require(:franchise).permit(:title)
  end
end
