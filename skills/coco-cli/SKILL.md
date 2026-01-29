---
name: coco-cli
description: ODB++ PCB design file analysis CLI. Query layers/nets/components, measure feature distances, analyze net clearances, render PNG images.
license: LicenseRef-Proprietary
compatibility: Requires coco CLI binary. Supports Windows, macOS, Linux.
metadata:
  author: Pentacube
  version: "0.1.0"
---

# coco CLI

Command-line tool for analyzing ODB++ PCB design files.

## When to Use

**Use coco CLI in these situations:**

1. **ODB++ folder detected** - Directory containing `matrix/`, `steps/`, `misc/` folders
2. **PCB-related queries** - Layer, net, component, feature, distance measurement requests
3. **DFM verification** - Clearance checks, short detection, design rule validation
4. **Keywords present** - ODB++, PCB, Gerber, layer, netlist, DRC

## Installation

```bash
# Check installation
coco --help

# If not installed
# Linux/macOS:
./scripts/install.sh
# Windows:
./scripts/install.ps1
```

## ODB++ Folder Identification

ODB++ folders are identified by internal structure (folder name is irrelevant):

```
<any_name>/       <- path for --input
├── matrix/
├── steps/
└── misc/
```

If `matrix/`, `steps/`, `misc/` folders are all present, it's an ODB++ root.

## Command Usage

**Always check `--help` for current options:**

```bash
# List all commands
coco --help

# Get command-specific options
coco <command> --help
```

### Key Commands

| Command | Purpose |
|---------|---------|
| `list-layers` | List layers |
| `list-nets` | List nets |
| `list-components` | List components |
| `list-features` | List features |
| `measure` | Measure distance between features |
| `net-distance` | Minimum distance between nets |
| `net-length` | Calculate net total length |
| `render` | Render layer as PNG |

### Common Options

| Option | Description |
|--------|-------------|
| `--input <path>` | ODB++ root directory (required) |
| `--layer <name>` | Layer name |
| `--step <name>` | Step name (usually auto-detected) |
| `--format json` | JSON output |

## Basic Workflow

```bash
# 1. When ODB++ folder found, first check layers
coco list-layers --input <odb_path>

# 2. Analyze based on user request
coco <command> --help  # Check options before running
```

## Use Cases

- [DFM Clearance Verification](references/usecase-dfm.md)
- [Net Analysis](references/usecase-net.md)

## Troubleshooting

| Symptom | Solution |
|---------|----------|
| command not found | Run `scripts/install.sh` |
| step not found | Specify `--step <name>` option |
