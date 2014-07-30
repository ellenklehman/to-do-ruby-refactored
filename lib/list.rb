class List
  @@all_lists = []

  def initialize(name)
    @name = name
    @tasks = []
  end

  def name
    @name
  end

  def tasks
    @tasks
  end

  def List.all
    @@all_lists
  end

  def save
    @@all_lists << self
  end

  def List.clear
    @@all_lists = []
  end


  def add_task(input)
    @tasks << input
  end

  def sort_tasks
    @tasks.sort! {|task_a, task_b| task_b.priority <=> task_a.priority }
  end

end
