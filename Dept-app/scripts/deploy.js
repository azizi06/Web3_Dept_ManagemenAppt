async function main() {
  const Dept = await ethers.getContractFactory("Dept");

  // Start deployment, returning a promise that resolves to a contract object
  const Dept_ = await Dept.deploy();
  console.log("Contract address:", Dept_.address);


}

main()
 .then(() => process.exit(0))
 .catch(error => {
   console.error(error);
   process.exit(1);
 });