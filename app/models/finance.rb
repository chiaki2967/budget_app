class Finance < ApplicationRecord
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate  :not_one_hundred # カスタムバリデーション
  validate  :not_system
  validates :date, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: ["収入", "支出"] }

  def not_one_hundred
    if amount == 100
      errors.add(:amount, "は 100 は入力しないでください")
    end
  end

  def not_system
    if amount == 150 && kind == "収入"
      errors.add(:base, "amontに150,kindに収入を記載しないでください")
    end
  end
end
