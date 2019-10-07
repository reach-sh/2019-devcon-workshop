'reach 0.1 exe';

/*
  This is an abstraction of a multi-signature wallet.

  Once Reach has support for dynamic sets of participants and
  participant-polymorphic abstractions it will be easier to write a
  real multi-signature wallet, but for now, here is a demonstration of
  how something this would work.

  The parent deposits money into the account at the beginning and the
  child makes requests to extract the money.

  In this way, the child is like one of the peers in the wallet and
  the parent is like the set of all the other peers who determine if
  the transaction goes through.

*/

const Child = participant({});
const Parent = participant({});

const DELAY = 10; // in blocks

function main() {
}
