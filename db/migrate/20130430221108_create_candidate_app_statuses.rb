class CreateCandidateAppStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_app_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
