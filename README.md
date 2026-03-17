# mc-server-kit

A set of Bash scripts to deploy and manage a Minecraft Java server on headless Linux systems. Born out of being tired of setting up servers manually every time on a fresh machine.

Currently targets **Ubuntu/Debian only**. Arch support is on the roadmap.

> ⚠️ This project is in active early development. Things will change. See the [roadmap](#roadmap) below.

---

## What it does right now (v0.1.0)

- Fetches the latest vanilla server jar straight from Mojang's API — no manual downloading
- Writes `eula.txt` automatically (no more forgetting)
- Generates a `server.properties` with sane defaults
- Launches the server inside a **tmux** session so you can detach and it keeps running in the background

That's it for now. Solid foundation, more coming soon.

---

## Requirements

- Ubuntu or Debian-based Linux
- Must be run as root (`sudo`)
- Internet connection
- `curl`, `jq`, `tmux` — the script installs these automatically if they're missing

---

## Quick Start

```bash
git clone https://github.com/pabal95/pabals-mc-server-kit
cd pabals-mc-server-kit
sudo ./install.sh
```

Follow the prompts. The script will ask where to install, what port to use, and how much RAM to give the server.

---

## Managing your server

| What you want to do | Command |
|---|---|
| Attach to the live console | `tmux attach -t minecraft` |
| Detach without stopping the server | `Ctrl+B` then `D` |
| Stop the server | Attach, then type `stop` and hit Enter |

---

## Roadmap

- [x] v0.1.0 — vanilla jar download, eula, server.properties, tmux launch
- [ ] v0.2.0 — systemd service (auto-start on boot)
- [ ] v0.3.0 — Java version detection and auto-install based on MC version
- [ ] v0.4.0 — whitelist setup, bring-your-own-jar (Fabric, Forge, etc.)
- [ ] v0.5.0 — Cloudflare DDNS for residential/dynamic IP setups
- [ ] v1.0.0 — Arch Linux support, full polish

---

## Why

I self-host Minecraft servers and got tired of doing the same setup steps every time on a fresh machine. This is my attempt to automate all of it into one script. It's also a personal project I'm using to actually learn Bash and Linux systems properly — so expect it to grow.

---

## License

MIT
