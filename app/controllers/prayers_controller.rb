class PrayersController < ApplicationController 
    def index
        
    end
    
    def new
      @prayer = Prayer.new
    end
    
    def create
      @prayer = Prayer.new(prayer_params)
      @prayer.save
      flash[:success] = "Prayer Request has been published"
      redirect_to prayers_path
    end
    
    def show 
      @prayer = Prayer.all(params{:id})
    end
    
    private
    
    def prayer_params
      params.require(:prayer).permit(:title, :body)
    end
end