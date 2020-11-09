class AddIbackgroundToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :background, :text
  end
end
