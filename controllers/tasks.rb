require 'sinatra'
# require 'rack-flash'

# Get/Create/Delete Task
class TaskAPI < Sinatra::Base
  get '/api/v1/tasks' do
    begin
      tasks_json = Task.all.to_json
    rescue => e
      logger.info "FAILED to get tasks: #{e.inspect}"
      halt 400
    end

    status 200
    tasks_json
  end

  get '/api/v1/tasks/:id' do
    begin
      id = params[:id]
      task = Task.where(id: id).first
      task_json = task.to_json
    rescue => e
      logger.info "FAILED to get certain task with given id: #{e.inspect}"
      halt 400
    end

    status 200
    task_json
  end

  post '/api/v1/tasks' do
    begin
      task = JSON.parse(request.body.read)
      Task.create(task)
    rescue => e
      logger.info "FAILED to create new task: #{e.inspect}"
      halt 400
    end
    # puts saved_message
    status 201
  end

  delete '/api/v1/tasks/:id' do
    begin
      del_id = params[:id]
      task = Task.where(id: del_id).first
      task.delete
    rescue => e
      logger.info "FAILED to create new task: #{e.inspect}"
      halt 400
    end

    status 201
  end
end
