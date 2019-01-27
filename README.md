# Bounty dApp

This is dApp where people can post or submit work that they are willing to pay a bounty for.

## Project Structure
* / - contains the Ethereum smart contract code, migration, and test,
* apps/ - contains the Reach web app,
* docs/ - holds the other documentation required for the projecs (besides this one)

## How To Setup The Project
### Git
#### Get Git
Git is available at https://git-scm.com/ , which offers a way to download an installer for your platform. 

For some platforms, it will be provided as part of the base installation, like MacOS or many Linux distributions, though maybe not at the most recent releases.

For platforms with package managers, like APT on Ubuntu or Brew on MacOS, please refer to a Google search on how to acquire git through the use of the tool specific to your operating system.

There are alternative clients that wrap Git in a UI, like SourceTree (Mac), Kraken (Linux), or TortoiseGit (Windows). Feel free to explore these if you like.

#### Clone This Project From Github
From whatever command line your OS offers, navigate to a directory that you wish to host the application files and run the following command:
```
git clone https://github.com/ptpedroj/2018-2019-eth-dev-prog-final.git
```

### Node.js
#### Get Node
Node is available here at the following link -
https://nodejs.org/en/

It is recommended to use the latest LTS version (10.x.y aka Dubnium at the time of this writing).

##### NVM
Altenatively, since Node gets updated often, you can explore using NVM (Node Version Manager) to install Node. 

For Linux and MacOS, it can be installed per these instructions - https://github.com/creationix/nvm/blob/master/README.md . 

For Windows, with these instructions - https://github.com/coreybutler/nvm-windows/blob/master/README.md

Note: NVM for Linux and Mac is notably different from the Windows version.


### Install Development Packages
Check that you can run `npm` from your command line. You may need to open a fresh new terminal or command window if you freshly installed Node, as it is a quick and easy way to run it with the latest version of your PATH variable. Run this command to confirm - 
```
npm --version
```
If an error occurs, that `npm` is not found, please troubleshoot via a Google search on the matter.

#### Global Development Packages
Install these global packages if you do not already have them.

##### Update npm (optional)
Node comes with `npm` though not necessarily the latest version. You can update to the latest with this command -
```
npm install -g npm
```

##### Install Truffle
The [Truffle Framework](https://truffleframework.com/) is necessary for running this project. Install Truffle with this command -
```
npm install -g truffle
```

##### Install Ganache CLI
A local development Ethereum blockchain is necessary to run the project locally. For this, install [Ganache CLI](https://github.com/trufflesuite/ganache-cli), the command line interface (CLI) version of [Ganache](https://truffleframework.com/ganache), with this command -
```
npm install -g ganache-cli
```

#### Local Development Packages
##### Install Development Libraries
In the terminal / command window, make sure that the current working directory is the one for the cloned project (e.g. 2018-2019-eth-dev-prog-final). From there, the following command should install all of the local packages needed to run the project - 
```
npm install
```

##### Install Web App Libraries
Open a separate command, navigate to the project folder. Run the two commands -
```
cd app
npm install
```

#### Browser Setup
##### Install Metamask
Using Chrome, Firefox, or Brave, do a web search for Metamask extension. Install it in your browser and activate it. Do not create a login yet.

## Run The Project
### Start Ganache CLI
Open a separate command window (yes, a third one), start up the Ganache CLI with this command -
```
ganache-cli
``` 
Copy the mnemonic generated by Ganache CLI in a text editor. It will be helpful for setting up Metamask.

### Compile The Contracts
Run this command to compile the contracts from the project directory - 
```
truffle compile
```

### Migrate The Contracts To The Blockchain
Run the command to migrate the compiled contracts to the local blockchain in Ganache CLI (--reset is there in case the command was run once before) -
```
truffle migrate --reset
```

### Test the Contracts
To run the test code, run this command -
```
truffle test
```

### Run The Local App Server
Return to the command window that has the `app/` subfolder as the current working password and run this command -
```
npm start
```

### Setup Metamask
Using the browser where Metamask was installed, click on the Metamask fox icon in the browser tool bar. Click on the bottom link which reads "Import using account seed phrase".

Using the mnemonic that was copied to the text editor, paste it into the Wallet Seed text area, provide a password with a confirmation, and click on Restore.

### Use The App
If a browser is not yet open, open one and go to http://localhost:3000 and run the app.