class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @pin = Pin.find(params[:id])
    @pin_attachments = @pin.pin_attachments.all
    @comments = @pin.comment.all
    @comment = @pin.comments.build
  end

  def new
    @pin = current_user.pins.build
    @pin_attachment = @pin.pin_attachments.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
        if @pin.save
            params[:pin_attachments]['pictures'].each do |a|
              @pin_attachment = @pin.pin_attachments.create!(:pictures => a, :pin_id => @pin.id)
            end        
          redirect_to @pin, notice: "Your Pin was successfully created."
        else
          render action: 'new'
        end
  end

  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
      else
        render action: 'new'
      end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url, notice: 'Pin was successfully destroyed.' 
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # what a user is able to do to form
    def pin_params
      params.require(:pin).permit(:title, :description, :price, :image, :pin_attachments, :comment, :comments, :category_id)
    end

end