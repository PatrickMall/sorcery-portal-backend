class RenameColumnNameInAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_column :answers, :Answer, :answer
  end
end
