require "rails_helper"

RSpec.describe "GET /rating_questions" do
  let!(:question) do
    RatingQuestion.create!(title: "Hello World")
  end

  it "shows a list of rating questions" do
    get "/rating_questions.json"
    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json.is_a?(Array)).to be true

    first_question = json.first
    expect(first_question["id"]).to eq(question.id.to_s)
    expect(first_question["title"]).to eq(question.title)
  end
end

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




