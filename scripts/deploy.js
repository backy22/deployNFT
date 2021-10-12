async function main() {
  // We get the contract to deploy
  const MapleStory = await ethers.getContractFactory("MapleStory");
  const mapleStory = await MapleStory.deploy();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
