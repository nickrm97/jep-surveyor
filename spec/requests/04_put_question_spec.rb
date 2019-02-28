require "rails_helper"
require "pry"

RSpec.describe "PUT /ratingQuestions/:id" do
  context "when the question exists" do
    it "returns a 200 OK" do
      post "/rating_questions.json", params:{rating_question: { title: "Hello World", tag: "greetings" }} 
      question = JSON.parse(response.body)
      put "/rating_questions/#{question["id"]}", params: {rating_question: { title: "Hello Mars" }}
      expect(response.status).to eq(200)
    end

    it "changes just the title attribute" do
      post "/rating_questions.json", params:{rating_question: { title: "Hello World", tag: "greetings" }}
      question = JSON.parse(response.body)
      put "/rating_questions/#{question["id"]}", params: {rating_question: { title: "Hello Mars" }}
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello Mars")
      expect(question.key?("tag")).to be true
    end
  end

  context "asking to PUT a question that doesn't exist" do
    it "returns a 404 Not Found" do
      put "/rating_questions/i-will-never-exist", params:{rating_question: { title: "Hello Mars", tag: "greetings" }} 
      expect(response.status).to eq(404)
    end
  end
end
