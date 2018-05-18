class AddEmailToFeedbacks < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :email, :text
  end
end
