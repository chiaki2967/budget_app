class BudgetsController < ApplicationController
  def top
  end

  def finances
    @finance = Finance.new
  end

  def create
    # params[:finance]
    # => {"kind" => "支出", "date" => "2026-01-15", "amount" => "99999"}

    @finance = Finance.new(finance_params)
    if @finance.save
      flash[:success] = "保存に成功しました！"
      redirect_to top_path # redirect_to "/budgets/top" と同じ意味
    else
      render :finances, status: :unprocessable_entity
    end
  end

  def list
    @finances = Finance.all
  end

  private

  def finance_params
    params.require(:finance).permit(:amount, :date, :kind)
  end

end
