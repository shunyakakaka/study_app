class RecordsController < ApplicationController

  def index
    @records = @current_user.records.all
  end

  def new
    @record = @current_user.records.new(flash[:record])
  end

  def create
    @record = @current_user.records.new(record_params)
    
    if @record.save
      flash[:notice] = "記録しました"
      redirect_to user_path(@current_user)
    else
      flash[:error_message] = @record.errors.full_messages
      flash[:record] = @record
      redirect_to new_record_path
    end
  end

  private

  def record_params
    params.require(:record).permit(:time, :task_kind)
  end
end
