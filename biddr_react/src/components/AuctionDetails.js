import React from 'react';

function AuctionDetails (props) {
  const {
    title, description, user = {}, endson, created_at, bids = []
  } = props;

  console.log(props)

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
    </div>
  );
}

export default AuctionDetails;
