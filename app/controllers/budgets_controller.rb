class BudgetsController < ApplicationController
  def top
  end

  def finances
    @finance = Finance.new
  end

  def create
    # params[:finance]
    # => { "kind" => "支出", "date" => "2026-01-15", "amount" => "99999" }

    @finance = Finance.new(finance_params)
    if @finance.save
      flash[:success] = "保存に成功しました！"
      redirect_to top_path # redirect_to "/budgets/top" と同じ意味
    else
      render :finances, status: :unprocessable_entity
    end
  end

  def list
    if params[:t].present?
      @finances = Finance.where(amount: params[:t])
    else
      @finances = Finance.all
    end
  end

  def detail
    @finance = Finance.find(params[:id])
  end

  def delete
    @finance = Finance.find(params[:id])
    @finance.destroy
    flash[:success] = "削除に成功しました！"
    redirect_to budgets_list_path
  end

  def edit
    @finance = Finance.find(params[:id])
  end

  def update
    @finance = Finance.find(params[:finance][:id])
    if @finance.update(finance_params)
      flash[:success] = "編集に成功しました！"
      redirect_to budgets_list_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def finance_params
    params.require(:finance).permit(:amount, :date, :kind)
  end
end