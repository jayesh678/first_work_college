class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :business_partner
  belongs_to :category
  has_one_attached :receipt
  before_create :generate_application_number


  private
  def generate_application_number
    category_prefix = category_prefix_for_application_number
    last_application_number = Expense.where(category_id: category_id).maximum(:application_number).to_i
    new_application_number = last_application_number + 1
    loop do
      candidate_application_number = "#{category_prefix}#{new_application_number}"
      unless Expense.exists?(application_number: candidate_application_number)
        self.application_number = candidate_application_number
        break
      end
      new_application_number += 1
    end
  end
  
  
  def category_prefix_for_application_number
    if category_id == 7
      'E-'
    else 
      'T-'
    end
  end
end
