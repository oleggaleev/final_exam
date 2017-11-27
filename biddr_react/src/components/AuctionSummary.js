import React from 'react';
import {Link} from 'react-router-dom';

function AuctionSummary (props) {
  const {id, title, creation_date, user} = props;

  return (
    <div className="AuctionSummary">
      <Link to={`/auctions/${id}`}>{title}</Link> • {creation_date}
    </div>
  );
}

export default AuctionSummary;
