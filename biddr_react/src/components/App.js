import React, { Component } from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Link
} from 'react-router-dom';
import jwtDecode from 'jwt-decode';
import AuthRoute from './AuthRoute';

// P A G E S
import AuctionsIndexPage from './AuctionsIndexPage';
import AuctionsShowPage from './AuctionsShowPage';
import AuctionsNewPage from './AuctionsNewPage';
import SignInPage from './SignInPage';

class App extends Component {
  constructor (props) {
    super(props);

    this.state = {
      user: {}
    };
    this.signIn = this.signIn.bind(this);
  }

  componentDidMount () {
    this.signIn()
  }

  signIn () {
    const jwt = localStorage.getItem('jwt');
    if (jwt) {
      const payload = jwtDecode(jwt)
      this.setState({user: payload})
    }
  }

  isSignedIn () {
    return !!this.state.user.id
  }

  _renderNavBar () {
    return (
      <nav>
        <h3>BIDDR</h3>
        <Link to="/">Home</Link>
        <Link to="/auctions/new">New Auction</Link>
        <Link to="/auctions">Auctions</Link>
        { this.isSignedIn()
            ? <span>Hello, {this.state.user.first_name}</span>
            : <Link to="/sign_in">Sign In</Link>
        }
      </nav>
    );
  }

  render () {
    return (
      <Router>
        <div className="App">
          {this._renderNavBar()}
          <Switch>
            <AuthRoute
              isAuthenticated={this.isSignedIn()}
              path="/auctions/new"
              component={AuctionsNewPage}
            />
            <AuthRoute
              isAuthenticated={this.isSignedIn()}
              path="/auctions/:id"
              component={AuctionsShowPage}
            />
            <AuthRoute
              isAuthenticated={this.isSignedIn()}
              path="/auctions"
              component={AuctionsIndexPage}
            />
            <Route
              path="/sign_in"
              render={props => <SignInPage {...props} onSignIn={this.signIn}/>}
            />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;
