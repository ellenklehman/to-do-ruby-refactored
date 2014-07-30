require './lib/task'
require './lib/list'



def main_menu
  puts "'q' Create a List \n
  ------------------------- \n
  'z' Show Lists \n
  ------------------------- \n
  'a' Add a Task \n
  ------------------------- \n
  'l' Show Tasks for a specific list \n
  ------------------------- \n
  't' Show all tasks \n
  -------------------------\n
  'x' Exit."
  # puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'q'
    add_list
  elsif main_choice == 'z'
    list_lists
  elsif main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 't'
    show_all_tasks
  elsif main_choice == 'x'
    puts "Goodbye"
  else
  puts "Sorry, that wasn't a valid option."
  end
end

def add_list
  puts 'Create a List.'
  user_list = gets.chomp
  List.new(user_list).save
  puts "Created a List"
  puts "\n\n"
  main_menu
end

def list_lists
  List.all.each_with_index do |item, index|
    puts item.name
  end
  main_menu
end

def add_task
  List.all.each_with_index do |item, index|
    puts item.name
  end
  puts "What list would you like to add a task to?"
  selected_list = gets.chomp
  List.all.each_with_index do |item, index|
    if selected_list == item.name
      puts 'Enter a description of the new task.'
      user_description = gets.chomp
      puts 'Enter a priority for the new task (1 - 5)'
      user_priority = gets.chomp.to_i
      Task.new(user_description, user_priority).save
      item.add_task(Task.new(user_description, user_priority))
    puts "Task added."
    puts "\n\n"
    else
    puts "That is not a valid list name."
    end
  end
  main_menu
end

def list_tasks
  List.all.each_with_index do |item, index|
    puts item.name
  end
  puts "What list would you like to see tasks for?"
    selected_list = gets.chomp

    List.all.each_with_index do |item, index|
    if selected_list == item.name
      item.sort_tasks
      "\n"
      item.tasks.each_with_index do |item2, index2|

        puts "#{item2.description} (#{item2.priority})"
      end
    else
    puts "That is not a valid list name."
    end
  end
end

def show_all_tasks
  Task.all.each_with_index do |item, index|
  puts "#{item.description} (#{item.priority})"
  end
  main_menu
end

puts "\n\n"


main_menu
