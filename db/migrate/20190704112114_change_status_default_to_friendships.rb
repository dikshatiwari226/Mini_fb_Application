class ChangeStatusDefaultToFriendships < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :friendships, :status_id, 1
  end
end
