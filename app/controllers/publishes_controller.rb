class PublishesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]

    def index
    @status = Status.find(params[:status_id])
    @publish = @status.publishes(params[:id])
    respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @status }
   end
 end

   def show
    @status = Status.find(params[:status_id])
    @publish = @status.publishes(params[:id])
    respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @status }
  end
end

    
    def create
      @status = Status.find(params[:status_id])
      @publish = @status.publishes.create(params[:publish])
       redirect_to status_publishes_path(@status)
    end

   def update
    @user = User.find_by_profile_name(params[:id])
    @status = Status.find(params[:status_id])
    @publish = @status.publish(params[:id])
    @publish.update_attributes(params[:slide])
    redirect_to status_publish_path
  end

   def destroy
    @status = Status.find(params[:status_id])
    @publish = @status.publish.find(params[:id])
    @publish.destroy
    redirect_to status_path(@status)
  end
 end