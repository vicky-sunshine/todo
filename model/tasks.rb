require 'json'
require 'sequel'

# Holds a full configuration file's information
class Task < Sequel::Model
  plugin :timestamps, update_on_create: true
  def to_json
    { type: 'task',
      id: id,
      task: task,
      created_at: created_at }.to_json
  end
end
