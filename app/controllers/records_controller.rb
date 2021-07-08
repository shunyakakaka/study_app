class RecordsController < ApplicationController

  def index
    @records = @current_user.records.all
  end

  def new
    @record = @current_user.records.new(flash[:record])
  end

  def create
    @record = @current_user.records.new(record_params)
    binding.pry
    #saveしているとsaveの後で代入しても変わらない
    if @record.valid?
      if @current_user.records.all.length == 0
        @record.total_time = @record.time
        @record.save
        redirect_to users_path
        binding.pry
      else
        before_record = @current_user.records.all.last
        binding.pry
        #@record.total_timeはnilであるため0を代入しないと計算できない
        @record.total_time = 0
        @record.total_time += before_record.total_time
        @record.total_time += @record.time
        @record.save
        flash[:notice] = "記録しました"
        redirect_to users_path
      end
    else
      flash[:error_message] = @record.errors.full_messages
      flash[:record] = @record
      redirect_to new_record_path
    end
    binding.pry
  end

  private

  def record_params
    params.require(:record).permit(:time, :task_kind)
  end
end
