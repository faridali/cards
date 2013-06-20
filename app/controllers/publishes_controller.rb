class PublishesController < ApplicationController
	  def show
    @status = Status.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  def create
    @status = Status.find(params[:status_id])
    @publish = @status.publishes.create(params[:publish])
       respond_to do |format|
      if @publish.save
        format.html { redirect_to (status_publish_path(@status)) }
        format.json { render json: @status, publish: :created, location: @status }
      else
        format.html { redirect_to @status, alert: 'Sorry! Something went wrong. Please try again later.' }
        format.json { render json: @slide.errors, publish: :unprocessable_entity }
      end
    end


   def index
    @publishes = Publishes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishes }
    	end
	end
	end
end