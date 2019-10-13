require_relative 'database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep|
      Peep.new(id: peep['id'], text: peep['text'])
    }
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;").first
    Peep.new(id: result['id'], text: result['text'])
  end

  attr_reader :id, :text
  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
