#File: hw222.rb
require "active_record"

# Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3",:database => "testdb.sqlite")

# Define database schema, and create database "people"
class ReminderTableScript < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.string :title
      t.string :due_date
      t.string :status
    end
  end

  def self.down
    drop_table :reminders
  end
end

# Create the table that will be used in the database
ReminderTableScript.up

class Reminder < ActiveRecord::Base
end

