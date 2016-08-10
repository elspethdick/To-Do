require "rails_helper"

feature "User sees own todos" do
  scenario "doesn't see others' todos" do
    Todo.create!(title: "Buy milk", email: "some@example.com")
    sign_in_as "someone@example.com"

    expect(page).not_to have_css ".todos li", text: "Buy milk"
  end

  scenario "does see own todos" do
    Todo.create!(title: "Walk dog", email: "real@person.com")
    sign_in_as "real@person.com"

    expect(page).to have_css ".todos li", text: "Walk dog"
  end
end
