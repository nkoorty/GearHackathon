const express = require('express');
const bodyParser = require('body-parser');
const { GearApi, GearKeyring } = require('@gear-js/api');

const destination = '0xdf5bde906194f865357590306c0547fea22df91c84b40ed0da43af343f7c8b40';

const fs = require('fs');

async function addToKeyring(password) {
    const gearApi = await GearApi.create({
      providerAddress: 'wss://rpc-node.gear-tech.io',
    });
    const jsonKeyring = fs.readFileSync('json.json', 'utf8');
    const keyring = GearKeyring.fromJson(jsonKeyring, password);

    const address = keyring.address;
    console.log(`Address: ${address}`);
    return address;
}

const app = express();
const PORT = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.post('/post', async (req, res) => {
    const { jsonData, password } = req.body;
    fs.writeFileSync('json.json', jsonData);
    const address = await addToKeyring(password);
    res.json({
      message: 'Received the request!',
      address: address 
    });
});

app.get('/getAddress', async (req, res) => {
    const jsonKeyring = fs.readFileSync('json.json', 'utf8');
    const address = jsonKeyRing.address;
    res.json({ address: address });
  });
  
  app.get('/getAttack', async (req, res) => {
    const jsonKeyring = fs.readFileSync('dynamic_data.json', 'utf8');
    res.json({ 
        attack: 10
     });
  });

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});