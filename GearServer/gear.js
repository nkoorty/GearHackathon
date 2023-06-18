import { GearApi } from '@gear-js/api';

const gearApi = await GearApi.create({ providerAddress: 'wss://rpc-node.gear-tech.io' });

const chain = await gearApi.chain();
const nodeName = await gearApi.nodeName();
const nodeVersion = await gearApi.nodeVersion();
const genesis = gearApi.genesisHash.toHex();