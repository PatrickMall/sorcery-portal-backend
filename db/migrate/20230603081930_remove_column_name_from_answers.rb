class RemoveColumnNameFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :Question_number, :string
  end
end
