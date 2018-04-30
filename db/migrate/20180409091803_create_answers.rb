class CreateAnswers < ActiveRecord::Migration[5.1]



  if ActiveRecord::Base.connection.data_source_exists? 'answers'

  else
    def change
      create_table :answers, unless_exists: true  do |t|
        t.string :body

        t.timestamps
      end
    end
  end

end
