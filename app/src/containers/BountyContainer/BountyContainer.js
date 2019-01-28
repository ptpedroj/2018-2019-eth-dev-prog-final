import React from "react";
import ActiveAccount from "../../components/ActiveAccount/ActiveAccount";
import BountyList from "../../components/BountyList/BountyList";
import OwnedBountyList from "../../components/OwnedBountyList/OwnedBountyList";

const BountyContainer = (props) => (
    <div>
        <ActiveAccount />
        <BountyList />
        <OwnedBountyList />
    </div>
)

export default BountyContainer;