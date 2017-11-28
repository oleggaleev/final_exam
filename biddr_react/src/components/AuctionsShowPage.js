import React, {Component} from 'react';
import AuctionDetails from './AuctionDetails';
import {Auction} from '../lib/requests';

class AuctionsShowPage extends Component {
  constructor (props) {
    super(props);

    this.state = {
      auction: {}
    };
  }

  componentDidMount () {
    const {params} = this.props.match;

    Auction
      .get(params.id)
      .then(auction => this.setState({auction}))
  }

  render () {
    return (
      <div className="AuctionsShowPage">
        <AuctionDetails {...this.state.auction} />
      </div>
    );
  }
}

export default AuctionsShowPage;
