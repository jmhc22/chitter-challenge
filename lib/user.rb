require_relative 'database_connection'

class User

  def self.sign_in(handle:)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE handle = '#{handle}';").first
    @current_user = User.new(id: result['id'], name: result['name'], handle: result['handle'],
      email: result['email'], password: result['password'])
  end

  def self.create(name:, handle:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, handle, email, password)
      VALUES('#{name}', '#{handle}', '#{email}', '#{password}') RETURNING id, name, handle,
      email, password;").first
    User.new(id: result['id'], name: result['name'], handle: result['handle'], email: result['email'],
      password: result['password'])
  end

  def self.current_user
    @current_user
  end

  attr_reader :id, :name, :handle, :email, :password
  def initialize(id:, name:, handle:, email:, password:)
    @id = id
    @name = name
    @handle = handle
    @email = email
    @password = password
  end
end
