class CreateMoodboards < ActiveRecord::Migration[7.0]
  def change
    create_table :moodboards do |t|
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
