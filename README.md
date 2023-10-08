# UniDAO

This Repository contains submissions for the Assignments for UniDAO

# To execute Week 4's my-nft2 app, Use the below commands:

npm install
npm install @openzeppelin/contracts@4.4.2
npm install @pinata/sdk
npx hardhat compile
npx hardhat run scripts/deploy.js --network sepolia
node scripts/mint.js
node scripts/updateNFTImage.js