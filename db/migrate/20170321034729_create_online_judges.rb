class CreateOnlineJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :online_judges do |t|
      t.belongs_to :user, index: true
      t.string :site
      t.string :account_name

      t.timestamps
    end
  end
end
