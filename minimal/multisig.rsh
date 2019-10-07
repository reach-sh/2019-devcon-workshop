'reach 0.1 exe';

const Child = participant({});
const Parent = participant({});

const DELAY = 10; // in blocks

function main() {
  Child.publish()
    .timeout(DELAY, _, () => {
      commit();
      return [0, 0]; });
  commit();
  
  Parent.only(() => {
    const allowance = declassify(is(uint256, interact.allowance())); });
  Parent.publish(allowance)
    .pay(allowance)
    .timeout(DELAY, _, () => {
      commit();
      return [0, 0]; });

  var [ bal, oks, nos ] = [ allowance, 0, 0 ];
  invariant(balance() == bal);
  while ( bal != 0 ) {
    commit();
    
    Child.only(() => {
      const howMuch = declassify(is(uint256, interact.request(bal)));
      assume(howMuch <= bal); });
    Child.publish(howMuch)
      .timeout(DELAY, Parent, () => {
        [ bal, oks, nos ] = [ bal, oks, nos ];
        continue; });
    require(howMuch <= bal);
    commit();

    Parent.only(() => {
      const approval = declassify(is(bool, interact.approve(howMuch, bal))); });
    Parent.publish(approval)
      .timeout(DELAY, Child, () => {
        [ bal, oks, nos ] = [ bal, oks, nos + 1 ];
        continue; });

    if ( approval ) {
      transfer(howMuch).to(Child);
      [ bal, oks, nos ] = [ bal - howMuch, oks + 1, nos ];
      continue; }
    else {
      [ bal, oks, nos ] = [ bal, oks, nos + 1 ];
      continue; } }

  commit();
  
  return [ oks, nos ]; }
