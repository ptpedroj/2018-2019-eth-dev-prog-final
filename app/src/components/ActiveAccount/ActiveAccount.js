import React from "react";
import { AccountData } from "drizzle-react-components";

const ActiveAccount = () => (
    <div>
        <h2>Active Account</h2>
        <AccountData accountIndex="0" units="ether" precision="3" />
    </div>
);

export default ActiveAccount;