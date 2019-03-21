import * as React from "react";
import axios from "axios";

import Form from "./Form";
import * as styles from "./RatingQuestion.module.scss";

interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
  removeQuestionFromList(id: string): void;
}

interface RatingQuestionState {
  title: string;
  formActive: boolean;
}

class RatingQuestion extends React.Component<
  RatingQuestionProps,
  RatingQuestionState
> {
  state = {
    title: this.props.title,
    formActive: false
  };

  changeTitle(title: string) {
    this.setState({ title });
  }

  switchEditForm = () => {
    this.state.formActive
      ? this.setState({ formActive: false })
      : this.setState({ formActive: true });
  };

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

  renderEditFormOrQuestion = () => {
    if (this.state.formActive) {
      return <Form title={this.state.title} />;
    } else {
      return (
        <div>
          <a href={this.props.url}>{this.state.title}</a>
          <button onClick={this.handleEdit}>Edit</button>
          <button onClick={this.handleDelete}>Delete</button>
        </div>
      );
    }
  };

  render() {
    return (
      <div className={styles.ratingQuestion}>
        {this.renderEditFormOrQuestion()}
      </div>
    );
  }
}

export default RatingQuestion;
