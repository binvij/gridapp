class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :looking_for_change

      t.timestamps
    end

    Candidate.create(first_name: "Bindesh", last_name: "Vijayan", email: "binvij@gmail.com", looking_for_change: true)
     Candidate.create(first_name: "Joana", last_name: "James", email: "joanaj@gmail.com", looking_for_change: true)
      Candidate.create(first_name: "Morgan", last_name: "Snyder", email: "morgans@gmail.com", looking_for_change: true)
      Candidate.create(first_name: "Katey", last_name: "Icewa", email: "kicewa@microsoft.com", looking_for_change: false)
      Candidate.create(first_name: "Evan", last_name: "Basalik", email: "ebasalik@microsoft.com", looking_for_change: false)

  end
end
