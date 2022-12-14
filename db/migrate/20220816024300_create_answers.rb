class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text :content
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
