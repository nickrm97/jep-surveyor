# frozen_string_literal: true

query = ''"
{
  testField
}
"''

result = SurveyorSchema.execute(query: query)

p result
