import React, {Component} from 'react';
import SignInForm from './SignInForm';
import {Token} from '../lib/requests.js';

class SignInPage extends Component {
  constructor (props) {
    super(props);
    this.signInUser = this.signInUser.bind(this);
  }

  signInUser (params) {
    const {onSignIn = () => {}} = this.props;

    Token
      .create(params)
      .then(data => {
        if (!data.error) {
          const {jwt} = data;
          localStorage.setItem('jwt', jwt);
          onSignIn();
          // The `history` prop is only available to components
          // rendered by the `<Route ... />` component of `react-router-dom`
          this.props.history.push("/");
        }
      })
  }

  render () {
    return (
      <div className="SignInPage">
        <h2>Sign In</h2>
        <SignInForm onSubmit={this.signInUser} />
      </div>
    )
  }
}

export default SignInPage;
