# GearHack

## Description
Gearhead is an iOS-based game that seamlessly integrates the Polkadot.js wallet of a user and allows uses the freemium Gear model to train, level up, and sell dynamic NFTs, also called Monsters or Pets. The problem that it solves is the bottleneck of Web-based games and integrating Web3 onto iOS devices in no time. Through a battle mechanic, which in the future going to use gas reservations to decide on a particular game strategy, decides the outcome of a game and based on the outcome, your Monster gains XP which allows it to dynamically change. Once a Monster gains XP, it becomes more valuable, and hence can be resold in a marketplace.
## Submission Requirements
### 1. Smart Contract
The gNFT smart contract was adapated towards the idea of the Monsters/Characters in the game having dynamic attributes. Changes to the samples were made in order to accommodate the particular data that is being request by the iOS frontend.
### 2. Testing
Gtest tests were implemented in the "dynamic-nft" folder inside of "GearNFT"
### 3. Frontend
Frontend is built using Swift (UIKit, and SpriteKit). See pictures below
### 4. Frontend Integration
Frontend interacts with Backend using HTTP requests, which are managed by an Express.js Server and a NetworkManager. The localhost is hosted in `GearServer`.
### 5. Installation
#### Backend
Install using npm 

    gear-js/gear-meta, express, @gear-js/api
    
Run the server

    node index.js
#### Frontend
Open the `xcodeproj` file, change the team, and run.


## Images
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/306617b5-ccb8-4528-bdbb-7e90cca0183e width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/1a1743ba-4f4b-42be-bdf0-e5b4c5543af2 width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/cca0b20c-f15e-4ffc-91e2-8cae7a6f2112 width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/e48f59d6-1997-48f7-b749-e1d0b99f4824 width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/a41b9a19-fcae-453f-a2a7-3da3802d85a2 width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/8593ec4d-8e2f-4ee1-8264-cc80f98ba1ba width=20% height=20%>
<img src=https://github.com/nkoorty/GearHackathon/assets/101601277/37f3ebff-9b51-459e-8b53-d53a3f1f5f87 width=20% height=20%>






