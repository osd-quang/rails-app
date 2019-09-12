class SearchImageController < ApplicationController
  # GET /Image
  def index
    GetImageJob.perform_later request.query_parameters

    render json: { status: "ok" }, status: :ok
    # @job = JobQueue.new()
    # query_params.convert_input_to_model(@job)

    # if @job.savey
    #   render json: @job, status: :ok
    # else
    #   render json: @job.errors, status: :unprocessable_entity
    # end
  end

  def get_images
    @res = ApiHelper.get("https://images-api.nasa.gov/search", request.query_parameters)

    render json: @res.to_s, status: :ok
  end

  def post_user
    @res = ApiHelper.post("https://travelhelperwebsite.azurewebsites.net/api/ApplicationUser/Register", query_params)

    render json: @res, status: :ok
  end

  def get_address
    @res = ApiHelper.get("https://travelhelperwebsite.azurewebsites.net/api/Users/Search", request.query_parameters)

    render json: @res.to_s, status: :ok
  end

  def query_params
    params.permit(:username, :password, :fullname)
  end
end
