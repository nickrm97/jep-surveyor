import * as React from "react";
import axios from "axios";
import * as styles from "./index.module.scss";
import RatingQuestion from "./RatingQuestion";

interface Question {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionsProps {
  questions: Question[];
}

interface RatingQuestionsState {
  questions: Question[];
}

class RatingQuestions extends React.Component<
  RatingQuestionsProps,
  RatingQuestionsState
> {
  state = { questions: this.props.questions };

  removeQuestionFromList = (id: string) => {
    this.setState({
      questions: this.state.questions.filter((question: Question) => {
        return question["id"] != id;
      })
    });
  };

  render() {
    return (
      <div>
        <div className={styles.list} data-automation-id="questions-list">
          {this.state.questions.map(question => (
            <RatingQuestion
              key={question.id}
              {...question}
              removeQuestionFromList={this.removeQuestionFromList}
            />
          ))}
        </div>
        <p>Link to create new page</p>
      </div>
    );
  }
}

export default RatingQuestions;
