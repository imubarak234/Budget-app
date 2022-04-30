class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = []
    @group = Group.find(params[:group_id])
    @var = 0
    record_logs = Log.where(group_id: params[:group_id]).order(created_at: :desc).pluck(:record_id)
    record_logs.each do | n |
      record = Record.find(n)
      @records.push(record)
      @var += record.amount
    end
    @var = @var.round(2)
  end

  def new 
    @record_new = current_user.records.new
    respond_to do |format|
      format.html { render :new, locals: { records: @record_new } }
    end
  end

  def create
    grouping = params.require(:records)[:group]
    record_create = Record.new(params.require(:records).permit(:name, :amount))
    record_create.update(author_id: current_user.id)
    
    respond_to do |format|
      format.html do
        if record_create.save
          grouping.each do |n|
            if n.to_i > 0
              Log.create(group_id: n.to_i, record_id: record_create.id)
            end
          end
          flash[:success] = 'Transaction created successfully'
          redirect_to group_records_path
        else
          flash.now[:error] = 'Error: Recipe could not be created'
          render :new, locals: { records: @record_new }
        end
      end
    end
  end
  
end
