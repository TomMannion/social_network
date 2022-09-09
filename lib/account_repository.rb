require 'account'

class AccountRepository
  def all
    query = 'SELECT * FROM accounts;'
    accounts = []
    result = DatabaseConnection.exec_params(query, [])
    result.each do |account|
      new_account = Account.new
      new_account.id = account['id']
      new_account.username = account['username']
      new_account.email = account['email']
      accounts << new_account
    end
    return accounts
  end

  def find(num)
    query = 'SELECT * FROM accounts WHERE id = $1;'
    params = [num]
    result = DatabaseConnection.exec_params(query, [num])
    result = result.first
    new_account = Account.new
    new_account.id = result['id']
    new_account.username = result['username']
    new_account.email = result['email']
    return new_account
  end

  def create(account)
    query = 'INSERT INTO accounts (username, email) VALUES ($1, $2);'
    params = [account.username, account.email]
    DatabaseConnection.exec_params(query, params)
  end

  def delete(id)
    query = 'DELETE FROM accounts WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(query, params)
  end
end