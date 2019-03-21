import React from "react";
import { render } from "react-dom";
import * as styles from "./Form.module.scss";

interface FormProps {
  title: string;
}

interface FormState {}

class Form extends React.Component<FormProps, FormState> {
  state = { title: this.props.title };

  handleChange = (e: React.FormEvent) => {
    this.setState({ title: (e.target as HTMLInputElement).value });
  };

  handleSubmit = () => {
    console.log(this.state.title);
  };

  render() {
    return (
      <div>
        <form className={styles.form} onSubmit={this.handleSubmit}>
          <label>Title:</label>
          <input
            type="text"
            defaultValue={this.props.title}
            onChange={this.handleChange}
          />
          <input type="submit" value="submit" />
        </form>
      </div>
    );
  }
}

export default Form;
