class PrayersController < ApplicationController 
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
      @prayer = Prayer.paginate(page: params[:page])
    end
    
    def new
      @prayer = Prayer.new
    end
    
    def edit
    
    end
    
    def create
      @prayer = Prayer.new(prayer_params)
      @prayer.user = current_user
      if @prayer.save
        flash[:success] = "Your Prayer Request has been published"
        redirect_to prayer_path(@prayer)
      else
        render 'new'
      end
    end
    
    def update
      if @prayer.update(prayer_params)
        flash[:success] = "Your Prayer Request was successfully updated"
        redirect_to prayer_path(@prayer)
      else
        render 'edit'
      end
    end
    
    def show 
      @prayer = Prayer.all(params{:id})
    end
    
    def destroy
      @prayer.destroy
      flash[:danger] = "Your Prayer request was successfully deleted"
      redirect_to prayers_path
    end
    private
    
    def set_prayer
      @prayer = Prayer.find(params[:id])
    end
    
    def prayer_params
      params.require(:prayer).permit(:title, :body)
    end
    
    def require_same_user
      if current_user != @prayer.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own prayer requests"
        redirect_to "/"
      end
    end
end