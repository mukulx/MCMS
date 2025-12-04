# MCMS - Minecraft Mobile Server

Run a Minecraft server on your Android phone.

## Installation

### Step 1: Install Proot Distro

```bash
curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/install.sh -o install.sh && bash install.sh
```

This will:
- Update Termux
- Install proot-distro
- Let you choose Ubuntu or Debian

### Step 2: Download MCMS (inside proot)

```bash
mkdir -p ~/mcms && cd ~/mcms
curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/mcms.sh -o mcms.sh
chmod +x mcms.sh
```

### Step 3: Run MCMS

```bash
./mcms.sh
```

## Run Again

```bash
proot-distro login ubuntu
cd ~/mcms && ./mcms.sh
```

## Update MCMS

```bash
cd ~/mcms
curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/mcms.sh -o mcms.sh
```

## Features

- **Paper, Purpur, Folia** - Choose your server software
- **Geyser + Floodgate** - Bedrock player support
- **playit.gg** - Free remote access
- **Auto Java** - Installs Java 17/21
- **Mobile Optimized** - Aikar's flags

## Commands

| Command | Description |
|---------|-------------|
| `./mcms.sh` | Interactive menu |
| `./mcms.sh --quick` | Quick Paper setup |
| `./mcms.sh --purpur` | Purpur setup |
| `./mcms.sh --folia` | Folia setup |
| `./mcms.sh --geyser` | Add Bedrock support |
| `./mcms.sh --playit` | Setup playit.gg |
| `./mcms.sh --start` | Start server |
| `./mcms.sh --background` | Background mode |

## Requirements

- Android (aarch64)
- [Termux](https://f-droid.org/packages/com.termux/) from F-Droid
- 2GB+ RAM

## Ports

- Java: `25565` (TCP)
- Bedrock: `19132` (UDP)
