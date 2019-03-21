import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import axios from "axios";

interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
  removeQuestionFromList(id: string): void;
}

interface RatingQuestionState {
  title: string;
}

class RatingQuestion extends React.Component<
  RatingQuestionProps,
  RatingQuestionState
> {
  state = {
    title: this.props.title
  };

  changeTitle(title: string) {
    this.setState({ title });
  }

  handleDelete = () => {
    console.log(this.props.url);
    axios
      .delete(this.props.url)
      .then(res => {
        this.props.removeQuestionFromList(this.props.id);
      })
      .catch(err => {
        console.log("ERROR: Could not delete question");
        console.log(err);
      });
  };

  render() {
    return (
      <div className={styles.ratingQuestion}>
        <a href={this.props.url}>{this.state.title}</a>
        <button onClick={this.handleDelete}>Delete</button>
      </div>
    );
  }
}

export default RatingQuestion;
