<div align="center">

<img src="assets/screenshots/cover.png" alt="Whispers App Cover" width="100%"/>

# Whispers 🤍
### *say what you never could*

An anonymous emotional space where people post the words they never said —  
to an ex, a parent, a lost friend, or themselves.

No accounts. No real names. No judgment. Just words — and every Friday, the slate is clean.

<br/>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

![Status](https://img.shields.io/badge/Status-In%20Development-a78bfa?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-1a1a2e?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-c9a0f0?style=flat-square)

</div>

---

## ✦ What is Whispers?

Some words were never meant to be sent. But they still need somewhere to go.

Whispers is a mobile app where you write the message you'll never send — tagged only by who it was *for*. A stranger reads it. Three emojis react. And every Friday at midnight, everything disappears.

No usernames. No profile photos. No followers. No chat. Just honesty, held gently for a week.

---

## ✦ Features

| Feature | Description |
|---|---|
| 📝 **Write & Release** | Post an unsent message (max 300 chars) tagged by relationship type |
| 🌊 **Global Feed** | Read anonymous messages from strangers around the world |
| 🤍 **React** | Three reactions only — 🤍 💔 😶 — no words, no judgment |
| 🪞 **My Whispers** | Your own private blog of everything you've released |
| 🔥 **Weekly Reset** | Every Friday, all posts are permanently deleted |
| 🛡️ **AI Moderation** | Every message filtered by OpenAI Moderation API before posting |
| 👤 **Nickname Only** | No email, no password — just a name you choose and a device ID |

---

## ✦ Screens

<div align="center">

| Splash | Home Feed | Write | Friday Reset | Rejected | Profile |
|:---:|:---:|:---:|:---:|:---:|:---:|
| <img src="assets/screenshots/splash.png" width="130"/> | <img src="assets/screenshots/home.png" width="130"/> | <img src="assets/screenshots/write.png" width="130"/> | <img src="assets/screenshots/reset.png" width="130"/> | <img src="assets/screenshots/rejected.png" width="130"/> | <img src="assets/screenshots/profile.png" width="130"/> |
| Enter with a nickname | Anonymous feed | Release your words | The slate is clean | This one stays with you | Your released words |

</div>

---

## ✦ Tech Stack

```
Frontend      → Flutter (Dart)
State         → Riverpod
Backend       → Firebase (Firestore + Cloud Functions)
Auth          → Anonymous (nickname + device ID, no email)
Moderation    → OpenAI Moderation API (free tier)
Design        → Figma + Stitch AI
CI/CD         → GitHub Actions (coming soon)
```

---

## ✦ How Content Moderation Works

Every message passes through a filter **before** it ever touches the database:

```
User writes message
      ↓
Flutter sends to Firebase Cloud Function
      ↓
Cloud Function calls OpenAI Moderation API
      ↓
Flagged (hate / sexual / violence)?
      ↓                    ↓
   YES → rejected      NO → saved to Firestore
   "this one           and posted to feed
   stays with you"
```

The OpenAI Moderation API is **completely free** with no rate limits for standard usage.

---

## ✦ The Weekly Reset

Every Friday at 23:59 UTC, a Firebase Cloud Function runs and permanently deletes every post in the database. Your nickname and device session remain — only the words disappear.

This is intentional. Nothing here is meant to last forever.

---

## ✦ Project Structure

```
whispers/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── theme/           # colors, typography, constants
│   │   └── utils/           # helpers, validators
│   ├── features/
│   │   ├── feed/            # home feed screen + logic
│   │   ├── write/           # write post screen + moderation call
│   │   ├── profile/         # my whispers screen
│   │   └── onboarding/      # splash + nickname entry
│   └── shared/
│       └── widgets/         # reusable UI components
├── functions/               # Firebase Cloud Functions
│   └── index.js             # moderation + weekly reset
├── assets/
│   └── screenshots/         # app screenshots for README
├── design/
│   └── figma_link.md        # link to Figma file
└── docs/
    └── SRS.md               # software requirements specification
```

---

## ✦ Getting Started

### Prerequisites
- Flutter 3.x installed
- Firebase CLI installed
- OpenAI API key (free — moderation endpoint only)

### Setup

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/whispers.git
cd whispers

# Install dependencies
flutter pub get

# Configure Firebase
# Add your google-services.json (Android) and GoogleService-Info.plist (iOS)
# to the respective platform folders

# Run the app
flutter run
```

### Environment Variables
Create a `.env` file at the root (never commit this):
```
OPENAI_API_KEY=your_key_here
```

---

## ✦ Design

The full design was created in **Figma** using Stitch AI as a starting point.

🎨 [View Figma File →](YOUR_FIGMA_LINK_HERE)  
🖼️ [View Behance Project →](YOUR_BEHANCE_LINK_HERE)

**Design language:** dark navy, soft lavender, near-white text. Quiet. Safe. A little melancholic.

---

## ✦ Roadmap

- [x] SRS & design system
- [x] Figma screens (all 6)
- [ ] Flutter UI — static screens
- [ ] Firebase integration
- [ ] OpenAI moderation Cloud Function
- [ ] Weekly reset Cloud Function
- [ ] GitHub Actions CI
- [ ] App Store / Play Store release

---

## ✦ About the Developer

Built by **[Your Name]** — a Syrian software engineer and designer building full-stack mobile experiences from scratch.

Design → Frontend → Backend → Deployment. All of it.

[![Behance](https://img.shields.io/badge/Behance-Portfolio-1769FF?style=flat-square&logo=behance)](YOUR_BEHANCE_LINK)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin)](YOUR_LINKEDIN_LINK)

---

## ✦ License

MIT License — see [LICENSE](LICENSE) for details.

---

<div align="center">
<sub>Built with honesty. Reset every Friday. 🤍</sub>
</div>
