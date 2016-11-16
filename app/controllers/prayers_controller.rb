class PrayersController < ApplicationController 
    def index
        
    end
    
    def new
      @prayer = Prayer.new
    end
end