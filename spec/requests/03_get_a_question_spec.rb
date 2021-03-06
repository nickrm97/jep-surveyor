require "rails_helper"

RSpec.describe "GET /rating_questions/:id" do
    context "when the question exists" do
      question = nil
    
      it "returns a 200 OK" do
        post "/rating_questions.json", params: { rating_question: { title: "Hello World"}}
        body = JSON.parse(response.body)
        get "/rating_questions/#{body["id"]}"
        question = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end 
  
      it "returns a question" do
        expect(question.is_a?(Hash)).to eq(true)
      end
    end
  
    context "asking to get a question that doesn't exist" do
      it "returns a 404 Not Found" do
        get "/rating_questions/i-will-never-exist"
        expect(response.status).to eq(404)
      end
    end
  end
  