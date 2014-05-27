require_dependency "jcrop_ahead/application_controller"

module JcropAhead
  class AttachmentsController < ApplicationController
    before_action :set_attachment, only: [:show, :edit, :update, :destroy, :jcrop]
    before_action :find_or_initialize, :only => [:new]
    # GET /attachments
    def index
      @attachments = Attachment.all
    end

    # GET /attachments/1
    def show
    end

    # GET /attachments/new
    def new
      
    end

    def jcrop
      
    end

    # GET /attachments/1/edit
    def edit
    end

    # POST /attachments
    def create
      @attachment = Attachment.new(attachment_params)

      if @attachment.save
        if params[:attachment][:image].present?
          redirect_to jcrop_attachment_path(@attachment)
        else
          redirect_to context_url(@attachment), notice: 'Imagen ha sido creada con éxito.'
        end
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /attachments/1
    def update
      if @attachment.update(attachment_params)
        if params[:attachment][:image].present?
          redirect_to jcrop_attachment_path(@attachment)
        else
          redirect_to context_url(@attachment), notice: 'Imagen ha sido actualizada con éxito.'
        end
      else
        render action: 'edit'
      end
    end

    # DELETE /attachments/1
    def destroy
      url = context_url(@attachment)
      @attachment.destroy
      redirect_to url, notice: 'Imagen ha sido eliminada con éxito.'
    end

    private

      def find_or_initialize
        @attachment = Attachment.find_or_initialize_by(:attachable_id => params[:attachable_id], :attachable_type => params[:attachable_type])
      end

      def context_url(object)
        model_object = object.attachable
        eval("#{model_object.class.name.pluralize.downcase}_path")
      end


      # Use callbacks to share common setup or constraints between actions.
      def set_attachment
        @attachment = Attachment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def attachment_params
        params.require(:attachment).permit(:image, :attachable_id, :attachable_type, :remove_image, :crop_x, :crop_y, :crop_w, :crop_h)
      end
  end
end
