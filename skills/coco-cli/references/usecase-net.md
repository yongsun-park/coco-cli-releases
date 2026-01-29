# Net Analysis

Analyze specific net paths, lengths, and features.

## Workflow

```bash
# 1. Search for nets
coco list-nets --input <odb_path> --pattern "<pattern>"

# 2. Get net features
coco list-net-features --input <odb_path> --net <net_name> --layer <layer_name>

# 3. Calculate net length
coco net-length --input <odb_path> --pattern "<net_pattern>"
```

## Check Options

```bash
coco list-nets --help
coco list-net-features --help
coco net-length --help
```
