require "rails_helper"

RSpec.describe "DELETE /ratingQuestions/:id" do
  context "with an existing question" do
    question = nil
    response_body = nil

    it "returns a 204 No Content" do
      post "/rating_questions.json", params: { rating_question: { title: "Hello World" }}
      question = JSON.parse(response.body)
      delete "/rating_questions/#{question["id"]}"
      response_body = response.body
      expect(response.status).to eq(204)
    end

    it "returns nothing" do
      expect(response_body.to_s).to eq('')
    end
  end

  context "asking to delete a question that doesn't exist" do
    it "returns a 404 Not Found" do
      delete "/rating_questions/i-will-never-exist"
      expect(response.status).to eq(404)
    end
  end
end




