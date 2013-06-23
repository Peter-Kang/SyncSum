class AddStatusToCandidateApp < ActiveRecord::Migration
  def change
  	add_column :candidate_apps, :candidate_app_status_id, :integer
  end
end
