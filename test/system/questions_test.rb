require "application_system_test_case"
require "test_helper"

class QuestionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit questions_url
  #
  #   assert_selector "h1", text: "Questions"
  # end
  test "visting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "How can I help you?"
  end
  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "ask"

    assert_text "I don't care, get dressed and go to work!"
  end
  test "ending with a question mark follows grumpy response" do
    visit ask_url
    fill_in "question", with: "Hello?"
    click_on "ask"

    assert_text "Silly question, get dressed and go to work!"
  end
  test "going to work -> great" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "ask"

    assert_text "Great!"
  end
end
