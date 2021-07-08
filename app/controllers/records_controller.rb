class RecordsController < ApplicationController

  def index
    @records = @current_user.records.all
  end

  def new
    @record = @current_user.records.new
  end

  def create
    @record = @current_user.records.create(record_params)
    flash[:notice] = "記録しました"
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:time, :task_kind)
  end
end
