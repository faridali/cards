class SlidesController < ApplicationController
before_filter :authenticate_user!

    def index
    @slides = Slides.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slides }
    end
  end

	  def create
    @status = Status.find(params[:status_id])
    @slide = @status.slides.create(params[:slide])
       respond_to do |format|
      if @slide.save
        format.html { redirect_to (status_path(@status, :anchor => "form")) }
        format.json { render json: @status, slide: :created, location: @status }
      else
        format.html { redirect_to @status, alert: 'Contents of slide must be between 1 - 200 characters long.' }
        format.json { render json: @slide.errors, slide: :unprocessable_entity }
      end
    end
   end

   	  def destroy
    @status = Status.find(params[:status_id])
    @slide = @status.slides.find(params[:id])
    @slide.destroy
    redirect_to status_path(@status)
  end

  def edit
    @status = Status.find(params[:status_id])
    @slide = @status.slides.find(params[:id])
  end

def update
    @status = Status.find(params[:status_id])
    @slide = @status.slides.find(params[:id])
    @slide.update_attributes(params[:slide])
    redirect_to (status_path(@status, :anchor => "slide_#{(@slide.id)}"))
  end

end
