class ToolsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_tool, only: %i[show update destroy]

  def index
    @tools = Tool.filter(permitted_params_filter).all
  end

  def show; end

  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      render :show, status: :created
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tool.update(tool_params)
      render :show, status: :ok
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tool.destroy
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def permitted_params_filter
    params.permit(:tag)
  end

  def tool_params
    params.require(:tool).permit(:title, :description, :link, tags: [])
  end
end
