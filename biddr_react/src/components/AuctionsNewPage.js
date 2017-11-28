import React, {Component} from 'react';
import AuctionForm from './AuctionForm';
import {Auction} from '../lib/requests';

class AuctionsNewPage extends Component {
  constructor (props) {
    super(props);
    this.createAuction = this.createAuction.bind(this);
  }

  createAuction (auction) {
    console.log('Creating Auction~!');
    Auction
      .create(auction)
      .then(auction => this.props.history.push(`/auctions/${auction.id}`))
  }

  render () {
    return (
      <div className="AuctionsNewPage">
        <h2>New Auction</h2>
        <AuctionForm onSubmit={this.createAuction}/>
      </div>
    )
  }
}

export default AuctionsNewPage;
