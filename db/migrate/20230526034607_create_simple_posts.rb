class CreateSimplePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :simple_posts do |t|
      t.string :external_id, null: false, index: true
      t.string :title
      t.string :image_url
      t.text :content

      t.timestamps
    end
  end
end
