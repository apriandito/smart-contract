pragma solidity ^0.5.11;

contract Follow {
    mapping (address => uint) public followingCount;
    mapping (address => mapping (address => bool)) public isFollowing;

    // Record a user's follow
    function follow(address _follower, address _followee) public {
        // Increment the followee's follower count
        followingCount[_followee]++;
        // Record the follow relationship
        isFollowing[_follower][_followee] = true;
    }

    // Unfollow a user
    function unfollow(address _follower, address _followee) public {
        // Decrement the followee's follower count
        followingCount[_followee]--;
        // Remove the follow relationship
        isFollowing[_follower][_followee] = false;
    }

    // Get the number of followers for a user
    function getFollowerCount(address _user) public view returns (uint) {
        return followingCount[_user];
    }
}
