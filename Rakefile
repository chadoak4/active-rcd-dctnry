require 'active_record_migrations'
require 'active_record'
require 'sqlite3'


ActiveRecordMigrations.configure do |config|
  config.database_configuration = {
    'development' => {
      'adapter'  => 'sqlite3',
      'database' => 'dictionary1.sqlite3'
    }
  }
  # Other settings:
  # config.schema_format = :sql # default is :ruby
end
ActiveRecordMigrations.load_tasks