class SlidesController < ApplicationController
before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]

    def index
      @slides = Slide.order("position")
   end

	  def create
    @status = Status.find(params[:status_id])
    @slide = @status.slides.create(params[:slide])
       respond_to do |format|
      if @slide.save
        format.html { redirect_to (status_path(@status, :anchor => "form")) }
        format.json { render json: @status, slide: :created, location: @status }
      else
        format.html { redirect_to @status, alert: 'Oops! That file type cannot be uploaded. You can upload .jpg, .gif, and .png files.' }
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

  def show
  @status = Status.find(params[:status_id])
  redirect_to status_path
  end

def update
    @status = Status.find(params[:status_id])
    @slide = @status.slides.find(params[:id])
    @slide.update_attributes(params[:slide])
    redirect_to (status_path(@status, :anchor => "slide_#{(@slide.id)}"))
  end

     def sort
    params[:slide].each_with_index do |id, index|
      Slide.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
