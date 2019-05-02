
import * as React from 'react'
import axios from 'axios'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'
import ApolloClient from 'apollo-boost';
import { gql } from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import { Query } from "react-apollo";

const client = new ApolloClient({
  uri: "http://localhost:3000/graphql"
});

interface Question {
  id: string,
  title: string
}

interface RatingQuestionsProps {
  questions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {

  render() {
    return(
      <div>
        <ApolloProvider client={client}>
          <div className={styles.list} data-automation-id='questions-list'>
            {this.props.questions.map((question) => <RatingQuestion key={question.id} {...question} />)}
          </div>
        <ApolloProvider />
      </div>
    )
  }
}

export default RatingQuestions
