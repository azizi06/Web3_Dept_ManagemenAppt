// SPDX-Licence-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Dept {
    enum TaskStatus {Pending, Payed}
    address owner; 
    struct Task {
        string name;
        string desc;
        TaskStatus status;
    }
    Task[] public tasks;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function addTask(string memory _desc,string memory name) public onlyOwner {
        tasks.push(Task(name,_desc, TaskStatus.Pending));
    }
    
    function markAsFinished(uint256 id) public onlyOwner {
        require(id < tasks.length, "No task has been mentioned");
        tasks[id].status = TaskStatus.Payed;
    }

    function getTaskCount() public view returns (uint256) {
        return tasks.length;
    }

    function getAllTasks() public view returns (Task [] memory){
        return tasks;
    }

    function getTask(uint256 id) public view returns (string memory,string memory, TaskStatus) {
        require(id < tasks.length, "No task has been mentioned");
        return(tasks[id].name,tasks[id].desc, tasks[id].status);
    }
}