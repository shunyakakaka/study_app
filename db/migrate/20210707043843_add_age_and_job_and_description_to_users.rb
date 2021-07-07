class AddAgeAndJobAndDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :job, :string
    add_column :users, :description, :text
  end
end
