import * as stdlib from '@reach-sh/stdlib';
import * as MULTISIG from './build/multisig.mjs';

( async () => {
  const startingBalance = stdlib.toWeiBN('100', 'ether');

  const parent = await stdlib.newTestAccount(startingBalance);
  const parentCtc = await parent.deploy(MULTISIG);
  const parentInteract = {
    allowance: () => {
      const amt = stdlib.toWeiBN('50', 'ether');
      return amt; },
    approve: (howMuch, balance) => {
      void(howMuch, balance);
      return true; } };
  const parentP = MULTISIG.Parent(parentCtc, parentInteract);

  const child = await stdlib.newTestAccount(startingBalance);
  const childCtc = await child.attach(MULTISIG, parentCtc.address, parentCtc.creation_block);
  const childInteract = {
    request: (balance) => {
      return stdlib.toBN(balance); } };
  const childP = MULTISIG.Child( childCtc, childInteract);

  const parentO = await parentP;
  const childO = await childP;

  console.log(`\nMulti-sig complete: ${parentO} ${childO}\n`);
  process.exit(0); })();
