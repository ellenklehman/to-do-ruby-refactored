require 'rspec'
require 'task'
require 'list'

describe Task do
  before do
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new('Buy Dog', 1)
    test_task.should be_an_instance_of Task
  end
  it 'lets you read the description out' do
    test_task = Task.new('Buy Dog', 1)
    test_task.description.should eq 'Buy Dog'
  end
  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end
  end
  describe '.clear' do
    it 'emties out all of the saved tasks' do
      Task.new('wash the lion', 2).save
      Task.clear
      Task.all.should eq []
    end
  end
  describe '#save' do
    it 'adds a task to the array of saved tasks' do
      test_task = Task.new('Buy Dog', 2)
      test_task.save
      Task.all.should eq [test_task]
    end
  end
end
describe List do
  it "creates and empty list of tasks" do
    test_list = List.new("home")
    test_list.tasks.should eq []
end

it "adds tasks" do
  test_list = List.new("Home")
  test_task = Task.new("Buy Dog", 1)
  test_list.add_task(test_task)
  test_list.tasks.should eq [test_task]
  end
end
