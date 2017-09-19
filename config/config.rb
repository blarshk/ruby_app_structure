module Config
  def self.database_user
    ENV["DB_USER"] || "postgres"
  end

  def self.database_password
    ENV["DB_PASSWORD"] || "postgres"
  end

  def self.database_host
    ENV["DB_HOST"] || "localhost"
  end

  def self.database_port
    ENV["DB_PORT"] || 5432
  end

  def self.database_name
    ENV["DB_NAME"] || "auron_dev"
  end

  def self.database_url
    ENV["DATABASE_URL"] || "postgres://#{database_user}:#{database_password}@#{database_host}:#{database_port}/#{database_name}"
  end
end