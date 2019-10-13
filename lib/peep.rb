require_relative 'database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep|
      Peep.new(id: peep['id'], text: peep['text'], created_at: peep['created_at'])
    }.reverse
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, created_at) VALUES('#{text.split("'").join("")}', '#{Time.now.strftime('%H:%M %D')}') RETURNING id, text, created_at;").first
    Peep.new(id: result['id'], text: result['text'], created_at: result['created_at'])
  end

  attr_reader :id, :text, :created_at
  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end
end
