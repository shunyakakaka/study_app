class AddOverallRankingAndGroupRankingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :overall_ranking, :integer, default: 0
    add_column :users, :group_ranking, :integer, default: 0
  end
end
