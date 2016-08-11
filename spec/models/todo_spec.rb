require 'rails_helper'

describe Todo, "#completed?" do
  it "returns true if completed_at is set " do
    todo = Todo.new(completed_at: Time.current)
    expect(todo).to be_completed
  end
  it "returns false it completed_at is nil"
end
