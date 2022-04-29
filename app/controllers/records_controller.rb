class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = []
    @group = Group.find(params[:group_id])
    @var = 0
    record_logs = Log.where(group_id: params[:group_id]).pluck(:record_id)
    record_logs.each do | n |
      record = Record.find(n)
      @records.push(record)
      @var += record.amount
    end
  end
end
