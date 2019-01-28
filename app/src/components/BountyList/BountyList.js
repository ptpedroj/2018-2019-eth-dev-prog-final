import React from "react";
import { ContractData } from "drizzle-react-components";

const BountyList = () => (
    <div>
        <h2>All Bounties</h2>
        <ContractData contract="BountyBoard" method="getAllBounties" />
    </div>
)

export default BountyList;