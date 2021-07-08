class RecordsController < ApplicationController

  def index
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    flash[:notice] = "記録しました"
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:time, :task_kind)
  end
end
