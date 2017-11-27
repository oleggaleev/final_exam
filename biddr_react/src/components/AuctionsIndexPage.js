import React, {Component} from 'react';
import AuctionList from './AuctionList';
import {Auction} from '../lib/requests';

class AuctionsIndexPage extends Component {
  constructor (props) {
    super(props);

    this.state = {
      auctions: []
    };
  }

  componentDidMount () {
    Auction
      .getAll()
      .then(data => { this.setState({auctions: data.auctions}); })
  }

  render () {
    return (
      <div className="AuctionsIndexPage">
        <AuctionList auctions={this.state.auctions} />
      </div>
    )
  }
}

export default AuctionsIndexPage;
