# Account creation
coles = Account.create(name: "Coles")
cultureAmp = Account.create(name: "Culture Amp")

# User creation
user1 = User.create(email: "user1@coles.com", password: "bark", account: coles)
user2 = User.create(email: "user2@coles.com", password: "bark", account: coles)
user3 = User.create(email: "user3@ca.com", password: "bark", account: cultureAmp)

# Survey creation
survey1 = Survey.create(name: "Coles engagement survey", account: coles)
survey2 = Survey.create(name: "Coles onboarding survey", account: coles)
survey3 = Survey.create(name: "Culture Amp engagement survey", account: cultureAmp)

# Question creation
question1 = RatingQuestion.create(title: "Do you like our company?", survey: survey1)
question2 = RatingQuestion.create(title: "Do you like to work?", survey: survey1)
question3 = RatingQuestion.create(title: "Do you like having fun?", survey: survey1)

question4 = RatingQuestion.create(title: "Why did you join us?", survey: survey2)
question5 = RatingQuestion.create(title: "Why did you leave your last role?", survey: survey2)

question6 = RatingQuestion.create(title: "Why is Culture Amp the best?", survey: survey3)
question7 = RatingQuestion.create(title: "Does work at Culture Amp engage you?", survey: survey3)