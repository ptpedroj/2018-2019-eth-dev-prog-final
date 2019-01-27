import BountyBoard from "./contracts/BountyBoard.json";

const drizzleOptions = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:8545",
    },
  },
  contracts: [BountyBoard],
  events: {
  },
  polls: {
    accounts: 1500,
  },
};

export default drizzleOptions;