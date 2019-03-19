import * as React from 'react'

interface Question{
    id: string,
    title: string
}


interface ShowRatingQuestionProps {
    question: Question
}

class ShowRatingQuestion extends React.Component<ShowRatingQuestionProps> {
  render() {
    return (
      <div>
        <p>{this.props.question.title}</p>
        <p>{this.props.question.id}</p>
      </div>
    )
  }
}

export default ShowRatingQuestion
