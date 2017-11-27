import React from 'react';

function AuctionForm (props) {
  const {onSubmit = () => {}} = props;

  const handleSubmit = event => {
    event.preventDefault();
    const {currentTarget} = event;

    const formData = new FormData(currentTarget);
    onSubmit({
      title: formData.get('title'),
      description: formData.get('description'),
      price: formData.get('price')
    });
  };

  return (
    <form className="AuctionForm" onSubmit={handleSubmit}>
      <div>
        <label htmlFor='title'>Title</label> <br />
        <input id='title' name='title' />
      </div>

      <div>
        <label htmlFor='description'>Description</label> <br />
        <textarea id='description' name='description' />
      </div>

      <div>
        <label htmlFor='price'>price</label> <br />
        <textarea id='price' name='price' />
      </div>

      <div>
        <input type='submit' value='Submit'/>
      </div>
    </form>
  )
}

export default AuctionForm;
