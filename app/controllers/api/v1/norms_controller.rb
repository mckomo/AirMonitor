module API::V1
  class NormsController < API::ApiController

    # GET /api/v1/norms
    def index
      @norms = Norm.includes(:subject).all

      render json: @norms, each_serializer: NormPreviewSerializer
    end

  end
end