class Task
  @@all_tasks = []

  def initialize(description, priority)
    @description = description
    @priority = priority
  end

  def description
    @description
  end

  def priority
    @priority
  end

  def Task.all
    @@all_tasks
  end

  def save
    @@all_tasks << self
  end

  def Task.clear
    @@all_tasks = []
  end

end

