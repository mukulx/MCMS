# MCMS - Minecraft Mobile Server

Run a Minecraft server on your Android phone.

## Install

```bash
curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/install.sh | bash
```

## Features

- Paper, Purpur, Folia servers
- Geyser + Floodgate (Bedrock support)
- playit.gg (free remote access)
- Auto Java installation
- Mobile optimized

## Run Again

```bash
proot-distro login ubuntu
cd ~/mcms && ./mcms.sh
```

## Update

```bash
proot-distro login ubuntu
cd ~/mcms
curl -sL https://raw.githubusercontent.com/mukulx/MCMS/main/mcms.sh -o mcms.sh
```

## Commands

| Command | Description |
|---------|-------------|
| `./mcms.sh` | Menu |
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
