class BillsController < ApplicationController
  def index
  	@bills = Bill.all
  end

  def show
  	@bill = Bill.find(params[:id])
  end

  def new
  	@bill = Bill.new
  end

  def create
  	@bill = Bill.create(bill_params)
  	if @bill.save
  		redirect_to @bill
  	else
  		render :new
  	end
  end

  def edit
  	@bill = Bill.find(params[:id])
  end

  def update
  	@bill = Bill.find(params[:id])
  	if @bill.update_attributes(bill_params)
  		redirect_to @bill
  	else
  		render :edit
  	end
  end

  def destroy
  	@bill = Bill.find(params[:id])
  	@bill.destroy
    redirect_to root_path
  end

  private

    def bill_params
    	params.require(:bill).permit(:title, :due_at, :amount, :is_paid)
    end
end
