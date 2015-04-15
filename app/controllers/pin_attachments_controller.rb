class PinAttachmentsController < ApplicationController
  before_action :set_pin_attachment, only: [:show, :edit, :update, :destroy]

  # GET /pin_attachments
  # GET /pin_attachments.json
  def index
    @pin_attachments = PinAttachment.all
  end

  # GET /pin_attachments/1
  # GET /pin_attachments/1.json
  def show
  end

  # GET /pin_attachments/new
  def new
    @pin_attachment = PinAttachment.new
  end

  # GET /pin_attachments/1/edit
  def edit
  end

  # POST /pin_attachments
  # POST /pin_attachments.json
  def create
    @pin_attachment = PinAttachment.new(pin_attachment_params)

    respond_to do |format|
      if @pin_attachment.save
        format.html { redirect_to @pin_attachment, notice: 'Pin attachment was successfully created.' }
        format.json { render :show, status: :created, location: @pin_attachment }
      else
        format.html { render :new }
        format.json { render json: @pin_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pin_attachments/1
  # PATCH/PUT /pin_attachments/1.json
  def update
    respond_to do |format|
      if @pin_attachment.update(pin_attachment_params)
        format.html { redirect_to @pin_attachment, notice: 'Pin attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin_attachment }
      else
        format.html { render :edit }
        format.json { render json: @pin_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pin_attachments/1
  # DELETE /pin_attachments/1.json
  def destroy
    @pin_attachment.destroy
    respond_to do |format|
      format.html { redirect_to pin_attachments_url, notice: 'Pin attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin_attachment
      @pin_attachment = PinAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_attachment_params
      params.require(:pin_attachment).permit(:pin_id, :pictures)
    end
end
