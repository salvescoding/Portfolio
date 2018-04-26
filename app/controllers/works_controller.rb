class WorksController < ApplicationController

  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @work_items = Work.all
  end

  def show
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path, notice: "Portfolio was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path, notice: "Portfolio was successfully updated"
    else
      render :edit
    end
  end



  private


  def work_params
    params.require(:work).permit(:title, :subtitle, :body, :main_image, :thumb_imageg)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end

