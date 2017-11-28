import React from 'react';
import {Bid} from '../lib/requests';
import BidForm from './BidForm';



function AuctionDetails (props) {
  const {
    id, title, description, user = {}, endson, history, created_at, bids = []
  } = props;
  debugger
  const createBid = function(params) {
    Bid
      .create(params)
      .then(({params}) => history.push(`/auctions/${id}`));
  }

  return (
    <div className="AuctionDetails">
      <h2>{title}</h2>
      <p>{description}</p>
      <p><em>By {user.first_name} {user.last_name}</em></p>
      <p><strong>Created at:</strong> {created_at}</p>
      <p>Ends on: {endson}</p>
      <h3>Bids</h3>
      <ul className="BidsList">
        {
          bids.map(bid => <li key={bid.id}>{bid.bid}</li>)
        }
      </ul>
      <div className='BidsNewPage'>
          <h4>New Bid</h4>
          <BidForm auctionId={id} onSubmit={createBid} />
      </div>
    </div>
  );
}

export default AuctionDetails;
