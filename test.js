const { GearApi, GearKeyring, createType } = require('@gear-js/api');
const fs = require('fs'); // need this to read files

const destination = '0xdf5bde906194f865357590306c0547fea22df91c84b40ed0da43af343f7c8b40'; // contract id where u sending message to

const tokenMetadata = { // input json
  name: "title",
  description: "description",
  media: "ipfs://bafkreibdabkeyhx2ud7aaemmcifxtgavqfgnnaos4rahnmn77axecg5wqq",
  reference: "",
};

async function sendMessage(destination, payload) {
  const gearApi = await GearApi.create({
    providerAddress: 'wss://rpc-node.gear-tech.io',
  });

  const jsonKeyring = fs.readFileSync('json.json', 'utf8'); // polkadot json
  const keyring = GearKeyring.fromJson(jsonKeyring, 'GearTest'); // passphrase

  const address = keyring.address;
  console.log(`Address: ${address}`);

//   const message = {
//     destination: destination, // contract id where u sending message to
//     payload: payload, // message content
//     gasLimit: 10000000,
//     value: 2500, // gas
//   };

//   try {
//     let extrinsic = gearApi.message.send(message);
//     extrinsic = extrinsic.signAndSend(keyring, (event) => {
//       console.log(event.toHuman());
//     });
//   } catch (error) {
//     console.error(`${error.name}: ${error.message}`);
//   }
}

sendMessage(destination, tokenMetadata).catch(console.error);