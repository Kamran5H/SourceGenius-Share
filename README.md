# 📦 Source Genius — Shareable Setup Package (v7.1.54)

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/Kamran5H/SourceGenius-Share)
[![Chrome MV3](https://img.shields.io/badge/Chrome-Manifest%20V3-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)](https://github.com/Kamran5H/SourceGenius-Share)
[![Turnkey](https://img.shields.io/badge/Deployment-One--Click%20Turnkey-10B981?style=for-the-badge)](https://github.com/Kamran5H/SourceGenius-Share)
[![Parent Project](https://img.shields.io/badge/Ecosystem-Source%20Genius-FF9900?style=for-the-badge&logo=amazon&logoColor=white)](https://github.com/Kamran5H/SourceGenius)

**The standalone, turnkey client deployment bundle of Source Genius for rapid workstation onboarding and automated configuration.**

[Overview](#-overview) • [Package Components](#-package-components) • [Turnkey Installation](#-step-by-step-onboarding) • [Troubleshooting](#-troubleshooting) • [License](#-license)

</div>

---

## 🌟 Overview

**SourceGenius-Share** is the zero-friction, redistributable workstation package of the [Source Genius](https://github.com/Kamran5H/SourceGenius) brand website discovery suite. Designed for swift onboarding of remote operators, team members, and clean Windows laptops, it packages both the **Manifest V3 Chrome Extension** and the **Autonomous Local Brand Reader** with a one-click automated setup script.

---

## 🧩 Package Components

This bundle couples two synchronized systems that operate in tandem:

```mermaid
flowchart LR
    A[START-HERE.bat] -->|Automated Verification| B(Chrome Extension: extension/)
    A -->|Environment Initialization| C(Local Scraper Daemon: scraper/)
    B <-->|Local WebSockets / HTTP Loopback: 127.0.0.1| C
    B -->|User Triggers| D[Amazon Product Page]
    C -->|Real Browser Playwright Session| D
    C -->|Extract Verified Brand & Website| B
```

1. **`extension/` (Chrome Manifest V3 Extension)**:
   - Provides the visual sidepanel UI inside Google Chrome.
   - Allows users to ingest ASINs, trigger brand extraction, and export leads.
2. **`scraper/` (Local Brand Reader Daemon)**:
   - Controls an anti-bot patched browser instance so Amazon serves unblocked product pages.
   - Without the scraper running, the extension UI functions, but product pages cannot be read.
3. **`START-HERE.bat` (Automated Bootstrap Script)**:
   - Automatically verifies Python installation, installs missing requirements, launches the local reader daemon, and guides the user to load the unpacked extension into Chrome.

---

## 📁 Repository Structure

```text
SourceGenius-Share/
├── START-HERE.bat              # One-click Windows turnkey launcher & health verifier
├── README.txt                  # Simple plain-text operator instructions
├── extension/                  # Complete Manifest V3 extension ready for Chrome
│   ├── manifest.json
│   ├── background.js
│   ├── sidepanel.html
│   └── sidepanel.js
├── scraper/                    # Local Python brand reader daemon & stealth drivers
│   ├── brand_reader.py
│   └── requirements.txt
├── .gitignore                  # Package and artifact exclusions
└── LICENSE                     # Open-source MIT License
```

---

## ⚡ Step-by-Step Onboarding

### 1. Initial Setup
1. Download or clone this repository to your target PC.
2. Double-click [`START-HERE.bat`](START-HERE.bat).
3. The script will automatically verify Python and start the local scraper worker.

### 2. Load Extension in Chrome
1. Open Google Chrome and visit `chrome://extensions/`.
2. Toggle on **Developer mode** in the upper-right corner.
3. Click **Load unpacked** and select the [`extension/`](extension/) directory from this folder.
4. Pin the **Source Genius** icon to your toolbar.

---

## 📜 License

This project is open-source and released under the [MIT License](LICENSE).  
Copyright (c) 2024-2026 **Kamran Ashraf**.
