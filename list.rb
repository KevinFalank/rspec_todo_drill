class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    valid_tasks?(tasks)
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    valid_task?(task)
    tasks << task
  end

  def complete_task(index)
    tasks[index].complete!
  end

  def delete_task(index)
    tasks.delete_at(index)
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end

  private

  def valid_tasks?(tasks)
    unless tasks.is_a? Array
      raise InvalidTasksType
    end
  end

  def valid_task?(task)
    unless task.is_a? String
      raise InvalidTask
    end
  end

end

class InvalidTasksType < StandardError; end
class InvalidTask < StandardError; end
