require "rspec"

require_relative "list"

describe List do
  let(:empty_list) { List.new("To Do") }
  let(:list) { List.new("To Do", [ "Write RSpec tests!!!" ]) }

    describe "#initialize" do
      context "with valid input and no tasks" do
        it "creates a new List with an empty array of tasks" do
          expect(empty_list.tasks.length).to eq(0)
        end
      end

      context "with valid input tasks in an array" do
        it "creates a new List with array of tasks" do
          expect(list.tasks.length).to eq(1)
        end
      end

      context "with invalid input (no arguments)" do
        it "raises an argument error when given no arguments" do
          expect{ List.new }.to raise_error(ArgumentError)
        end
      end

      context "with invalid input (tasks not in an array)" do
        it "creates an invalid tasks type" do
          expect{ List.new("To Do", "Tasks are hard!")}.to raise_error(InvalidTasksType)
        end
      end
    end

    describe "#add_task" do
      context "with valid input" do
        it "adds a task to the tasks array" do
          expect(empty_list.add_task("Y M C A!!")).to eq(["Y M C A!!"])
        end
      end

      context "with invalid input" do
        it "raises an argument error when given a non-string task" do
          expect{ empty_list.add_task(nil) }.to raise_error(InvalidTask)
        end
      end
    end
  # Your specs here
end
