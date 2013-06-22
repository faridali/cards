class PublishesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]

    def index
    @status = Status.find(params[:status_id])
    @publish = @status.publishes.first(params[:id])
    render "show"
 end

   def show
    @status = Status.find(params[:status_id])
  end
    
    def create
      @status = Status.find(params[:status_id])
      @publish = @status.publishes.create(params[:publish])
      @publish.save
      redirect_to status_publishes_path
  end

   def update
    @status = Status.find(params[:status_id])
  end

   def destroy
    @status = Status.find(params[:status_id])
    @publish = @status.publish.find(params[:id])
    @publish.destroy
    redirect_to status_path(@status)
  end
 end