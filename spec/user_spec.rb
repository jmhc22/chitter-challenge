require 'user'
require 'database_connection'

describe User do

  describe '.create' do
    it 'creating a user will return the user object and store data in database' do
      user = User.create(name: "James Clark", handle: "JC293", email: "test@test.com", password: "Password")

      database = DatabaseConnection.query("SELECT * FROM users WHERE handle = 'JC293';").first

      expect(user.name).to eq database['name']
      expect(user.handle).to eq database['handle']
      expect(user.email).to eq database['email']
      expect(user.password).to eq database['password']
    end
  end

  describe '.sign_in' do
    it 'after signing in the current user will become the signed in user' do
      user = User.create(name: "James Clark", handle: "JC293", email: "test@test.com", password: "Password")
      User.sign_in(handle: "JC293")

      expect(user.name).to eq User.current_user.name
      expect(user.handle).to eq User.current_user.handle
      expect(user.email).to eq User.current_user.email
    end
  end
end
