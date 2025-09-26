# AddressBookFactory

Factory pattern implementation for creating personal AddressBook contracts with OpenZeppelin Ownable integration.

## Description

This contract demonstrates the factory pattern in Solidity, allowing users to deploy their own personal AddressBook contracts. Each AddressBook is owned by the deployer and includes full CRUD operations for managing contacts with OpenZeppelin's access control.

## Contract Architecture

- **AddressBook**: Personal contact management contract with owner-only access
- **AddressBookFactory**: Factory contract for deploying new AddressBook instances

## AddressBook Features

- **Contact Management**: Add, delete, and retrieve contacts
- **Access Control**: Only owner can modify contacts using OpenZeppelin Ownable
- **Contact Structure**: ID, first name, last name, and multiple phone numbers
- **Efficient Storage**: Optimized contact storage and retrieval

## Factory Features

- **One-click Deployment**: Deploy personal AddressBook with single transaction
- **Event Logging**: Deployment events for tracking and verification
- **Owner Assignment**: Automatic owner assignment to deployer

## Deployment Instructions

**Important**: Deploy AddressBookFactory, not AddressBook directly!

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Create a new file and copy-paste the contract code
3. Compile the contract using Solidity ^0.8.19
4. **In the Deploy section, select "AddressBookFactory" from the contract dropdown**
5. Deploy AddressBookFactory on **Base Sepolia Testnet**
6. Call `deploy()` function to create your personal AddressBook
7. Use the returned address to interact with your AddressBook

## Submit Exercise

[📖 Submit New Keyword Exercise](https://docs.base.org/learn/new-keyword/new-keyword-exercise)
