class PublishesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

    def index
    @status = Status.find(params[:status_id])  
    @publishes = Publish.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishes }
      end
   end

   def show
    @status = Status.find(params[:status_id])
    @publish = @status.publish(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end
    

    def create
    @status = Status.find(params[:status_id])
    @publish = @status.build_publish(params[:publish])
       respond_to do |format|
      if @publish.save
        format.html { redirect_to (status_publishes_path) }
        format.json { render json: @status, publish: :created, location: @status }
      else
        format.html { redirect_to @status, alert: 'Sorry! Please try again later.' }
        format.json { render json: @publish.errors, publish: :unprocessable_entity }
      end
    end
   end
 end