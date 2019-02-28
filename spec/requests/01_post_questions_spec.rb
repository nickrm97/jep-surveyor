require "rails_helper"

RSpec.describe "POST /ratingQuestions" do

    let(:new_title) { "Hello World" }
    let(:new_tag) { "new tag" }
    
    context "when the request has a body" do
      
      it "returns a 201 Created" do
        post "/rating_questions.json", params: { rating_question: {title: new_title, tag: new_tag }}
        expect(response.status).to eq(201)
      end
  
      it "returns the new document" do
        post "/rating_questions.json", params: { rating_question: { title: new_title, tag: new_tag }}
        question = JSON.parse(response.body)
        expect(question.is_a?(Hash)).to eq(true)
        expect(question.key?("id")).to eq(true)
        expect(question["title"]).to eq(new_title)
        expect(question["tag"]).to eq(new_tag)
      end
    end
  
    context "when the request has no body" do
      it "returns a 400 Bad Request" do
        expect{ post "/rating_questions.json", params: {} }.to raise_error ActionController::ParameterMissing
      end
    end
  
    context "when the request has a blank title" do
      it "returns a 422 Invalid Resource" do
        post "/rating_questions.json", params: { rating_question: {title: "", tag: new_tag}}
        expect(response.status).to eq(422)
      end
  
      it "shows errors that the title cannot be blank" do
        post "/rating_questions.json", params: { rating_question: {title: "", tag: new_tag}}
        error = JSON.parse(response.body)
        expect(error).to eq({"errors" => {"title" => ["can't be blank"]}})
      end
    end
  end