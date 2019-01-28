import React from "react";
import { ContractData, ContractForm } from "drizzle-react-components";

const OwnedBountyList = () => (
    <div>
        <h2>Owned Bounties</h2>
        <ContractData contract="BountyBoard" method="getOwnedBounties" />
        <ContractForm contract="BountyBoard" method="createBounty" />
    </div>
)

export default OwnedBountyList;