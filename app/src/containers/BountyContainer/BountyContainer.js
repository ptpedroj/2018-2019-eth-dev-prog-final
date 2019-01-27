import ActiveAccount from "../../components/ActiveAccount/ActiveAccount";
import { drizzleConnect } from "drizzle-react";

const mapStateToProps = (state) => {
    return {
        accounts: state.accounts
    };
};

const BountyContainer = drizzleConnect(ActiveAccount, mapStateToProps);

export default BountyContainer;