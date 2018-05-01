class WorksController < ApplicationController

  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @work_items = Work.all
  end

  def angular
    @angular_work = Work.angular
  end

  def show
  end

  def new
    @work = Work.new
    3.times { @work.technologies.build }
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

  def destroy
    @work.destroy
    redirect_to works_path, notice: "Portfolio was successfully deleted"
  end



  private


  def work_params
    params.require(:work).permit(:title,
                                 :subtitle,
                                 :body,
                                 :main_image,
                                 :thumb_imageg,
                                 technologies_attributes: [:name])
  end

  def set_work
    @work = Work.find(params[:id])
  end
end

