<div align="center">

# 📝 Decentralized Note Keeper

**A note-taking app with no central database — notes are stored on-chain in a Motoko canister on the Internet Computer, owned and controlled entirely by the user.**

[![Internet Computer](https://img.shields.io/badge/Internet%20Computer-Motoko-29ABE2?logo=internetcomputer&logoColor=white)](https://internetcomputer.org)
[![React](https://img.shields.io/badge/React-16.8-61DAFB?logo=react&logoColor=black)](https://react.dev)
[![Material UI](https://img.shields.io/badge/Material--UI-4.x-007FFF?logo=mui&logoColor=white)](https://v4.mui.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

</div>

## Overview

This is a full-stack note-taking application built on the **Internet Computer (ICP)**. Instead of a traditional server and database, note data lives entirely in a canister — a smart contract that runs on-chain — written in **Motoko**. The React frontend talks directly to that canister via the DFINITY agent library, with no intermediary backend server involved.

Because storage is on-chain, notes persist independently of any single server: there's no company database that can go down, be sold, or be shut off — the canister keeps running on the Internet Computer network itself.

## ✨ Features

- **On-chain storage** — notes are persisted inside a Motoko canister rather than a conventional database
- **No backend server** — the React frontend calls canister methods directly via `@dfinity/agent`
- **Create, view, and manage notes** — standard note CRUD operations exposed as canister methods
- **Material UI interface** — a clean, component-driven UI built with Material-UI v4
- **Local development replica** — runs against a local Internet Computer replica via `dfx` for fast iteration before mainnet deployment

## 🧱 Tech Stack

| Layer | Choice |
|---|---|
| Backend / storage | [Motoko](https://internetcomputer.org/docs/current/motoko/main/motoko) canister (`dkeeper`) |
| Frontend | React 16, [Material-UI v4](https://v4.mui.com/) |
| Canister ↔ frontend bridge | [`@dfinity/agent`](https://www.npmjs.com/package/@dfinity/agent), `@dfinity/candid`, `@dfinity/principal` |
| Build tooling | Webpack 5, TypeScript |
| Platform SDK | [DFX](https://internetcomputer.org/docs/current/developer-docs/getting-started/install/) (Internet Computer SDK) |

## 🚀 Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/en/download/)
- [DFX](https://internetcomputer.org/docs/current/developer-docs/getting-started/install/) — the Internet Computer SDK (`sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"`)

### Installation

```bash
git clone https://github.com/Tensae-abita/decentralized-note-keeper.git
cd decentralized-note-keeper
npm install
```

### Run locally

Start a local Internet Computer replica in the background:

```bash
dfx start --background
```

Deploy the canisters (this compiles the Motoko backend and generates the frontend's Candid bindings):

```bash
dfx deploy
```

The deployed frontend will be available at:

```
http://localhost:8000?canisterId={asset_canister_id}
```

(the exact canister ID is printed by `dfx deploy`).

For active frontend development with hot reload, run the dev server separately — it proxies API calls to the local replica:

```bash
npm start
```

This serves the frontend at `http://localhost:8080`.

## 📁 Project Structure

```
src/
├── dkeeper/                  # Motoko backend canister
│   └── main.mo                # Note storage logic and canister methods
└── dkeeper_assets/            # React frontend
    ├── src/                    # Components, entrypoint (index.html)
    └── assets/                 # Static frontend assets

dfx.json                       # Canister configuration (backend + frontend)
webpack.config.js               # Frontend build configuration
```

## ⚙️ Configuration Notes

- `dfx.json` defines two canisters: `dkeeper` (the Motoko backend) and `dkeeper_assets` (the compiled frontend, which depends on `dkeeper`)
- Canister interface bindings are auto-generated into `src/declarations` from the compiled canister — run `npm run copy:types` (or `dfx deploy`, which triggers it automatically) after backend changes
- If hosting the frontend outside of `dfx` (e.g., on your own static host), set `NODE_ENV=production` at build time so the app doesn't attempt to fetch the local replica's root key

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.
