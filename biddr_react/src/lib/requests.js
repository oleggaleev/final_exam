const BASE_URL = 'http://localhost:3000';

function getJwt () {
  return localStorage.getItem('jwt');
}

export const Auction = {
  create (params) {
    return fetch(
      `${BASE_URL}/api/v1/auctions`,
      {
        method: 'POST',
        headers: {
          'Authorization': `JWT ${getJwt()}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(params)
      }
    ).then(res => res.json())
  },

  getAll () {
    return fetch(
      `${BASE_URL}/api/v1/auctions`,
      {
        headers: {'Authorization': `JWT ${getJwt()}`}
      }
    ).then(res => res.json());
  },

  get (id) {
    return fetch(
      `${BASE_URL}/api/v1/auctions/${id}`,
      {
        headers: {'Authorization': `JWT ${getJwt()}`}
      }
    ).then(res => res.json());
  }
}

export const Token = {
  create (params) {
    return fetch(
      `${BASE_URL}/api/v1/tokens`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(params)
      }
    ).then(res => {
      if (res.status === 200) {
        return res.json();
      } else {
        return {error: 'Something went wrong!'};
      }
    });
  }
}
