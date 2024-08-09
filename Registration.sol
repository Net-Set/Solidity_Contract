// user Registration
pragma solidity ^0.8.0;

contract Registration {
    struct User {
        address userAddress;
        string name;
        string email;
        string phone;
        string password;
    }

    // mapping to store user details
    mapping(address => User) public users;

    uint256 public userCount;

    // Add this to your contract's state variables
    address[] private userAddresses;

    // function to register a user
    function register(string memory _name, string memory _email, string memory _phone, string memory _password) public {
        require(users[msg.sender].userAddress == address(0), "User already registered");
        users[msg.sender] = User(msg.sender, _name, _email, _phone, _password);
        userAddresses.push(msg.sender);
        userCount++;
    }

    // function to get user details
    function getUserDetails(address _userAddress) public view returns (User memory) {
        return users[_userAddress];
    }

    // Update the getAllUsers function
    function getAllUsers() public view returns (User[] memory) {
        User[] memory allUsers = new User[](userCount);
        for (uint256 i = 0; i < userCount; i++) {
            allUsers[i] = users[userAddresses[i]];
        }
        return allUsers;
    }

    
    //function to update user details
    function updateUserDetails(address _userAddress, string memory _name, string memory _email, string memory _phone, string memory _password) public {
        users[_userAddress] = User(_userAddress, _name, _email, _phone, _password);
    }

    //function to delete user details 
    function deleteUserDetails(address _userAddress) public {
        delete users[_userAddress];
        userCount--;
    }

}