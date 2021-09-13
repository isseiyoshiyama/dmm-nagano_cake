class ChangeColumn1ToItem < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :items, :is_active, :boolean, default: true, null: false
  end

  # 変更前の状態
  def down
    change_column :items, :is_active, :boolean, default: false, null: false
  end
end
