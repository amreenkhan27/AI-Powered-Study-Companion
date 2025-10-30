// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AI Powered Study Companion
 * @dev A decentralized platform for tracking study progress, earning rewards, and accessing AI-powered learning resources
 */
contract Project {
    
    // Struct to store student information
    struct Student {
        address studentAddress;
        string name;
        uint256 studyHours;
        uint256 rewardTokens;
        uint256 lastStudyTimestamp;
        bool isRegistered;
    }
    
    // Struct to store study session details
    struct StudySession {
        uint256 sessionId;
        address student;
        string subject;
        uint256 duration; // in minutes
        uint256 timestamp;
        bool aiAssisted;
    }
    
    // State variables
    mapping(address => Student) public students;
    mapping(uint256 => StudySession) public studySessions;
    uint256 public sessionCounter;
    uint256 public constant REWARD_RATE = 10; // 10 tokens per hour of study
    address public owner;
    
    // Events
    event StudentRegistered(address indexed studentAddress, string name);
    event StudySessionLogged(uint256 indexed sessionId, address indexed student, string subject, uint256 duration);
    event RewardsEarned(address indexed student, uint256 amount);
    event TokensRedeemed(address indexed student, uint256 amount);
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier onlyRegistered() {
        require(students[msg.sender].isRegistered, "Student not registered");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        sessionCounter = 0;
    }
    
    /**
     * @dev Function 1: Register a new student on the platform
     * @param _name Name of the student
     */
    function registerStudent(string memory _name) public {
        require(!students[msg.sender].isRegistered, "Student already registered");
        require(bytes(_name).length > 0, "Name cannot be empty");
        
        students[msg.sender] = Student({
            studentAddress: msg.sender,
            name: _name,
            studyHours: 0,
            rewardTokens: 0,
            lastStudyTimestamp: 0,
            isRegistered: true
        });
        
        emit StudentRegistered(msg.sender, _name);
    }
    
    /**
     * @dev Function 2: Log a study session and earn rewards
     * @param _subject Subject studied
     * @param _duration Duration of study in minutes
     * @param _aiAssisted Whether AI assistance was used
     */
    function logStudySession(
        string memory _subject,
        uint256 _duration,
        bool _aiAssisted
    ) public onlyRegistered {
        require(_duration > 0, "Duration must be greater than 0");
        require(_duration <= 480, "Session cannot exceed 8 hours");
        require(bytes(_subject).length > 0, "Subject cannot be empty");
        
        // Create study session record
        sessionCounter++;
        studySessions[sessionCounter] = StudySession({
            sessionId: sessionCounter,
            student: msg.sender,
            subject: _subject,
            duration: _duration,
            timestamp: block.timestamp,
            aiAssisted: _aiAssisted
        });
        
        // Update student stats
        Student storage student = students[msg.sender];
        student.studyHours += _duration;
        student.lastStudyTimestamp = block.timestamp;
        
        // Calculate and award tokens
        uint256 hoursStudied = _duration / 60;
        uint256 rewardAmount = hoursStudied * REWARD_RATE;
        
        // Bonus for AI-assisted learning
        if (_aiAssisted) {
            rewardAmount += (rewardAmount * 20) / 100; // 20% bonus
        }
        
        student.rewardTokens += rewardAmount;
        
        emit StudySessionLogged(sessionCounter, msg.sender, _subject, _duration);
        emit RewardsEarned(msg.sender, rewardAmount);
    }
    
    /**
     * @dev Function 3: Redeem reward tokens for incentives
     * @param _amount Amount of tokens to redeem
     */
    function redeemTokens(uint256 _amount) public onlyRegistered {
        Student storage student = students[msg.sender];
        require(student.rewardTokens >= _amount, "Insufficient token balance");
        require(_amount > 0, "Amount must be greater than 0");
        
        student.rewardTokens -= _amount;
        
        emit TokensRedeemed(msg.sender, _amount);
        
        // In a real implementation, this would trigger off-chain actions
        // such as issuing certificates, unlocking premium content, etc.
    }
    
    // View functions
    function getStudentInfo(address _student) public view returns (
        string memory name,
        uint256 studyHours,
        uint256 rewardTokens,
        uint256 lastStudyTimestamp
    ) {
        Student memory student = students[_student];
        require(student.isRegistered, "Student not registered");
        return (
            student.name,
            student.studyHours,
            student.rewardTokens,
            student.lastStudyTimestamp
        );
    }
    
    function getStudySession(uint256 _sessionId) public view returns (
        address student,
        string memory subject,
        uint256 duration,
        uint256 timestamp,
        bool aiAssisted
    ) {
        require(_sessionId > 0 && _sessionId <= sessionCounter, "Invalid session ID");
        StudySession memory session = studySessions[_sessionId];
        return (
            session.student,
            session.subject,
            session.duration,
            session.timestamp,
            session.aiAssisted
        );
    }
    
    function getTotalSessions() public view returns (uint256) {
        return sessionCounter;
    }
}
