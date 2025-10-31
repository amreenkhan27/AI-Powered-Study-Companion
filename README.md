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

https://private-user-images.githubusercontent.com/233385364/507580145-47a2641b-91e6-4b37-a86d-ee428901aa5c.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjE5MDgzODUsIm5iZiI6MTc2MTkwODA4NSwicGF0aCI6Ii8yMzMzODUzNjQvNTA3NTgwMTQ1LTQ3YTI2NDFiLTkxZTYtNGIzNy1hODZkLWVlNDI4OTAxYWE1Yy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMDMxJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTAzMVQxMDU0NDVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1iOTA4OTc0NWI5N2RhMmU3OTk3ZjRkMTI0M2U2MzVlNWU1NGU4MWVjZDJmNWRiMWQ3Y2IzNmQwYWI3NGY2N2NiJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.DIrbHIXKekOPH0OFRV6XI9DEQ-VNP6upIXWy_tCgTvw
