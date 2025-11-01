# 🤖 AI Powered Study Companion (with REDEEM System)

### 📘 Overview

The **AI Powered Study Companion** is a blockchain-based learning platform designed to motivate students through **tokenized rewards**.  
It allows users to **create and share educational content** such as courses, notes, flashcards, and quizzes — while earning **points** that can be **redeemed** for StudyTokens.  

This smart contract system runs on **Ethereum (Solidity)** and can easily be extended with **AI-based evaluation** for personalized learning experiences.

---

## 💻 Smart Contracts

### 🪙 `StudyToken.sol`
- ERC20-style token called **StudyToken (STDY)**  
- Used for rewarding learners and redeeming study points  
- Mintable by the owner (companion contract can mint tokens during redeem)

### 🧠 `StudyCompanion.sol`
- Core logic of the platform  
- Handles:
  - Course creation  
  - Notes and flashcard submissions  
  - Quizzes (AI-verified off-chain if needed)  
  - User point tracking  
  - Token redemption (REDEEM system)  

#### 🔑 Main Functionalities

| Function | Description |
|-----------|--------------|
| `createCourse(string title, string description)` | Create a new course |
| `addNote(uint256 courseId, string ipfsHash)` | Add note linked to a course |
| `addFlashcard(uint256 courseId, string front, string back)` | Add Q&A flashcards |
| `createQuiz(uint256 courseId, string ipfsHash, uint256 rewardTokens)` | Add quizzes with token rewards |
| `redeemPoints(uint256 pointsToRedeem)` | Redeem earned points for StudyTokens |
| `setPointToTokenRate(uint256 newRate)` | Update conversion rate (points → tokens) |
| `setRewardToken(address tokenAddress)` | Link StudyToken contract |

---

## 🌟 Features

### 🎓 Learning System
- Create and manage **courses** by topic or subject  
- Upload **notes** and **flashcards** stored via IPFS  
- Design **quizzes** with token-based rewards  
- Students can **earn points** for every contribution

### 💰 Reward System

| Activity | Points Earned |
|-----------|----------------|
| Create Course | 5 Points |
| Add Note | 3 Points |
| Add Flashcard | 2 Points |
| Create Quiz | 4 Points |

Points can later be redeemed for tokens.

function redeemPoints(uint256 pointsToRedeem) external
https://ibb.co/wFFQChw1
