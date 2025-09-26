// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    struct Contact {
        uint256 id;
        string firstName;
        string lastName;
        uint256[] phoneNumbers;
    }

    mapping(uint256 => Contact) public contacts;
    uint256[] public contactIds;
    uint256 private nextId = 1;

    error ContactNotFound(uint256 id);

    // Constructor with initial owner parameter
    constructor(address _initialOwner) Ownable(_initialOwner) {}

    function addContact(
        string memory _firstName,
        string memory _lastName,
        uint256[] memory _phoneNumbers
    ) external onlyOwner {
        uint256 contactId = nextId++;
        contacts[contactId] = Contact(contactId, _firstName, _lastName, _phoneNumbers);
        contactIds.push(contactId);
    }

    function deleteContact(uint256 _id) external onlyOwner {
        if (contacts[_id].id == 0) {
            revert ContactNotFound(_id);
        }

        delete contacts[_id];

        for (uint256 i = 0; i < contactIds.length; i++) {
            if (contactIds[i] == _id) {
                contactIds[i] = contactIds[contactIds.length - 1];
                contactIds.pop();
                break;
            }
        }
    }

    function getContact(uint256 _id) external view returns (Contact memory) {
        if (contacts[_id].id == 0) {
            revert ContactNotFound(_id);
        }
        return contacts[_id];
    }

    function getAllContacts() external view returns (Contact[] memory) {
        uint256 validCount = 0;
        for (uint256 i = 0; i < contactIds.length; i++) {
            if (contacts[contactIds[i]].id != 0) {
                validCount++;
            }
        }

        Contact[] memory result = new Contact[](validCount);
        uint256 index = 0;
        for (uint256 i = 0; i < contactIds.length; i++) {
            if (contacts[contactIds[i]].id != 0) {
                result[index] = contacts[contactIds[i]];
                index++;
            }
        }

        return result;
    }
}

contract AddressBookFactory {
    event AddressBookDeployed(address indexed newAddress, address indexed owner);

    function deploy() external returns (address) {
        // Deploy new AddressBook with msg.sender as owner
        AddressBook newAddressBook = new AddressBook(msg.sender);
        
        // Emit event for verification
        emit AddressBookDeployed(address(newAddressBook), msg.sender);
        
        return address(newAddressBook);
    }
}
