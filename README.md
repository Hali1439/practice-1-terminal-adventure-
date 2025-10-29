# 🕵️ Practice 1 - Terminal Adventure Game

> **Master Linux command line skills through 14 challenging levels of terminal puzzles and cybersecurity challenges**

## 🎯 Overview

Practice 1 is an interactive terminal-based adventure game designed to teach essential Linux command line skills and cybersecurity concepts. Through 14 progressively challenging levels, you'll learn file navigation, permission management, cryptography, system administration, and problem-solving in a hands-on, gamified environment.

## 🚀 Quick Start

### Prerequisites
- Docker
- Docker Compose
- Basic terminal knowledge

### Installation & Setup

```bash
# Clone the repository
git clone https://github.com/your-username/practice-1-terminal-adventure.git
cd practice-1-terminal-adventure

# Build the environment
./scripts/build.sh

# Start the practice environment
./scripts/start.sh

# Connect to the game
docker exec -it terminal-adventure bash
```

### Alternative: Manual Docker Setup
```bash
docker build -t terminal-adventure .
docker run -it --name terminal-adventure terminal-adventure
```

## 🎮 Game Levels

### Level 1: The Beginning
**Skills**: Basic navigation, file reading
**Commands**: `cd`, `ls`, `pwd`, `cat`, `su`

### Level 2: The Dashed Files  
**Skills**: Special characters in filenames
**Commands**: Handling files named `-`

### Level 3: Hidden Files
**Skills**: Finding hidden files
**Commands**: `ls -a`, dot files

### Level 4: The Spaced Out Files
**Skills**: Files with spaces in names
**Commands**: Quotes and escape characters

### Level 5: Searching Through Millions
**Skills**: Pattern searching in large files
**Commands**: `grep`

### Level 6: Gzipped Files
**Skills**: File compression/decompression
**Commands**: `gunzip`, `zcat`, `/tmp` directory

### Level 7: Base64 Encoded Password
**Skills**: Encoding/decoding
**Commands**: `base64 -d`

### Level 8: AES-256-CBC Encryption
**Skills**: Cryptographic operations
**Commands**: `openssl enc`

### Level 9: Permission Denied
**Skills**: Privilege escalation
**Commands**: `sudo -l`, `sudo`

### Level 10: The Missing Password
**Skills**: User management
**Commands**: `passwd`, `sudo`

### Level 11: Network Detective
**Skills**: Network configuration
**Commands**: `ifconfig`, `ip addr`

### Level 12: Cron Job Hunter
**Skills**: Scheduled tasks
**Commands**: `crontab -l`, `/etc/cron.*`

### Level 13: UID Discovery
**Skills**: User identification
**Commands**: `id`, `/etc/passwd`

### Level 14: Victory!
**Achievement**: Terminator Commander

## 🛠️ Project Structure

```
practice-1-terminal-adventure/
├── scripts/          # Build and management scripts
├── src/levels/       # Individual level configurations
├── config/           # System configurations
├── docs/            # Documentation
├── tests/           # Validation tests
└── utils/           # Helper utilities
```

## 📚 Learning Objectives

By completing this practice, you will master:

### Core Linux Skills
- File system navigation and manipulation
- User and permission management
- Process and system monitoring
- Text processing and searching

### Cybersecurity Concepts
- Cryptographic operations (encoding, encryption, hashing)
- Privilege escalation techniques
- System hardening concepts
- Security through obscurity

### Problem-Solving
- Analytical thinking and debugging
- Methodical troubleshooting approaches
- Creative solution finding
- Persistence through challenges

## 🎯 Target Audience

- **Cybersecurity students** learning Linux fundamentals
- **IT professionals** refreshing command line skills
- **Programming students** understanding system operations
- **Anyone interested** in hands-on terminal practice

## ⚡ Features

- **Self-contained**: Everything runs in Docker containers
- **Progressive difficulty**: Start simple, advance to complex challenges
- **Real-world scenarios**: Based on actual cybersecurity concepts
- **Immediate feedback**: Know when you've solved each level
- **Safe environment**: Practice without risking your main system

## 🛡️ Safety & Best Practices

- All exercises run in isolated Docker containers
- No external network access required
- No system modifications to host machine
- Clean shutdown removes all temporary files

## 🔧 Troubleshooting

Common issues and solutions are documented in `docs/TROUBLESHOOTING.md`

### Quick Fixes:
```bash
# If container won't start
docker rm terminal-adventure
./scripts/cleanup.sh
./scripts/start.sh

# If permissions issues
docker exec -it terminal-adventure chmod +x /opt/levels/*/setup.sh

# If levels not loading
docker restart terminal-adventure
```

## 📈 Progress Tracking

Each level completion demonstrates mastery of specific skills:
- ✅ Level 1-5: Basic to intermediate Linux commands
- ✅ Level 6-10: System administration skills  
- ✅ Level 11-14: Advanced cybersecurity concepts

## 🏆 Completion

Upon completing all 14 levels, you'll earn the title **"Terminator Commander"** and receive a completion flag:

```
FLAG(Terminator_Commander)
```

## 🤝 Contributing

Want to add more levels or improve existing ones? See `CONTRIBUTING.md` for guidelines.

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## 🙏 Acknowledgments

- Inspired by ALX Cybersecurity curriculum
- Based on common CTF (Capture The Flag) challenges
- Community contributions and testing

---

**Ready to begin your terminal adventure?** 🚀

```bash
./scripts/start.sh
```

*"The terminal is your playground - master it and unlock infinite possibilities."*
