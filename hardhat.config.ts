//require("@nomiclabs/hardhat-waffle");
require("dotenv").config({ path: ".env" });
import "@nomicfoundation/hardhat-toolbox";

const ALCHEMY_RINKEBY_API_KEY_URL = process.env.ALCHEMY_RINKEBY_API_KEY_URL;
const INFURA_ROPSTEN_API_KEY_URL = process.env.INFURA_ROPSTEN_API_KEY_URL;
const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;

const API_TOKEN = process.env.API_TOKEN;

module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      forking: {
        url: INFURA_ROPSTEN_API_KEY_URL,
      }
    },
    rinkeby: {
      url: ALCHEMY_RINKEBY_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
    ropsten: {
      url: INFURA_ROPSTEN_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
  },
  
    
};
