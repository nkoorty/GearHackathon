const { ApiPromise, WsProvider } = require('@polkadot/api');
const { Keyring } = require('@polkadot/keyring');

async function main () {
  const wsProvider = new WsProvider('wss://rpc-node.gear-tech.io');
  const api = await ApiPromise.create({ provider: wsProvider });

  const keyring = new Keyring({ type: 'sr25519' });
  const alice = keyring.addFromMnemonic('arrow symbol fiber awesome agree toy skull pig pencil guard trigger casino'); 

  const transfer = api.tx.balances.transfer('5FFBGzXgeAACLiJJkNfC8gEiTMiZcjNHVASyLh7czeur162Q', 12345);

  const hash = await transfer.signAndSend(alice);

  console.log('Transfer sent with hash', hash.toHex());

}

main().catch(console.error);