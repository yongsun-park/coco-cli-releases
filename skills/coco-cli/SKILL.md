---
name: coco-cli
description: PCB design file analysis CLI (ODB++, Cadence .brd/.sip). Query layers/nets/components, measure feature distances, analyze net clearances, render PNG images.
license: LicenseRef-Proprietary
compatibility: Requires coco CLI binary. Supports Windows, macOS, Linux.
metadata:
  author: Pentacube
  version: "0.1.0"
---

# coco CLI

Command-line tool for analyzing PCB design files (ODB++, Cadence).

## When to Use

**Use coco CLI in these situations:**

1. **ODB++ folder detected** - Directory containing `matrix/`, `steps/`, `misc/` folders
2. **Cadence file detected** - `.brd` or `.sip` file, or Cadence `.out` directory
3. **PCB-related queries** - Layer, net, component, feature, distance measurement requests
4. **DFM verification** - Clearance checks, short detection, design rule validation
5. **Keywords present** - ODB++, PCB, Cadence, Allegro, layer, netlist, DRC

## Installation

```bash
# Check installation
coco --help
```

If not installed, use the install script or download manually:

```bash
# Linux/macOS:
./scripts/install.sh

# Windows (PowerShell):
./scripts/install.ps1
```

**Manual install (if scripts are blocked):**

Download the binary from [GitHub Releases](https://github.com/yongsun-park/coco-cli-releases/releases/latest) and add to PATH.

| OS | File | Default path |
|----|------|-------------|
| Windows | `coco-windows-x64.exe` | `%LOCALAPPDATA%\Pentacube\coco\coco.exe` |
| macOS (Apple Silicon) | `coco-macos-arm64` | `~/.local/bin/coco` |
| macOS (Intel) | `coco-macos-x64` | `~/.local/bin/coco` |
| Linux | `coco-linux-x64` | `~/.local/bin/coco` |

## Input Identification

### ODB++
ODB++ folders are identified by internal structure (folder name is irrelevant):

```
<any_name>/       <- path for --input
├── matrix/
├── steps/
└── misc/
```

If `matrix/`, `steps/`, `misc/` folders are all present, it's an ODB++ root.

### Cadence
- `.brd` or `.sip` file - auto-detected, uses Extracta + cache
- `.out` directory - use `--input-kind cadence`
- **Requires**: Cadence Extracta license (Extracta must be installed and licensed)

## Command Usage

**IMPORTANT: Always run `--help` first to discover available commands and options:**

```bash
# Discover all commands
coco --help

# Get specific command options (REQUIRED before using any command)
coco <command> --help
```

## Basic Workflow

```bash
# 1. Discover commands
coco --help

# 2. Check command options
coco list-layers --help

# 3. Run with appropriate options
coco list-layers --input <odb_path>
```

## Use Cases

- [DFM Clearance Verification](references/usecase-dfm.md)
- [Net Analysis](references/usecase-net.md)

## Troubleshooting

| Symptom | Solution |
|---------|----------|
| command not found | Run install script or download manually (see Installation) |
| step not found | Specify `--step <name>` option |
