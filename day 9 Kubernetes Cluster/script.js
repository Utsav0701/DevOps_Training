import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '1m', target: 50 }, // simulate ramp-up of traffic from 1 to 50 users over 1 minute
    { duration: '3m', target: 50 }, // stay at 50 users for 3 minutes
    { duration: '1m', target: 0 },  // ramp-down to 0 users
  ],
};

export default function () {
  let res = http.get('https://myapp.local/frontend');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
  sleep(1);
}
