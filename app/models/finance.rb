class Finance < ApplicationRecord
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: ["収入", "支出"] }
end
