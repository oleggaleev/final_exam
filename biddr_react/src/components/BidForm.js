import React from 'react';

function BidForm (props) {
  const {auctionId, onSubmit = () => {}} = props;


  const handleSubmit = event => {
    event.preventDefault();
    const {currentTarget} = event;

    const formData = new FormData(currentTarget);
    onSubmit({
      bid: formData.get('bid'),
      auction_id: auctionId
    });
  }

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor='bid'>Bid Amount</label> <br />
        <input id='bid' name='bid' />
      </div>

      <div>
        <input type='submit' value='Submit New Bid'/>
      </div>
    </form>
  );
}

export default BidForm;
