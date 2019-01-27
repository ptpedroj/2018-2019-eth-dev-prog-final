import React from 'react';
import { DrizzleProvider } from 'drizzle-react';
import { LoadingContainer } from 'drizzle-react-components';
import drizzleOptions from './drizzleOptions';
import Styles from "./App.module.css";
import BountyContainer from './containers/BountyContainer/BountyContainer';

const App = () => {
  return (
    <div className={Styles.App}>
      <DrizzleProvider options={drizzleOptions}>
        <LoadingContainer>
          <BountyContainer />
        </LoadingContainer>
      </DrizzleProvider>
    </div>
  );
}

export default App;
