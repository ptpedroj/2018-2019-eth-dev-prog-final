import BountyContainer from "../BountyContainer/BountyContainer";
import { drizzleConnect } from "drizzle-react";

const mapStateToProps = (state) => {
    return {
        accounts: state.accounts,
        BountyBoard: state.contracts.BountyBoard,
        drizzleStatus: state.drizzleStatus,
    };
};

const DrizzledBountyContainer = drizzleConnect(BountyContainer, mapStateToProps);

export default DrizzledBountyContainer;