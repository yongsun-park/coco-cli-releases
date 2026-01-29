# DFM Clearance Verification

Verify Design for Manufacturing (DFM) clearance rules in PCB designs.

## Workflow

```bash
# 1. Check layers
coco list-layers --input <odb_path>

# 2. Check net clearances on specific layer
coco net-distance-batch --input <odb_path> --layer <layer_name>

# 3. Inspect problematic feature details
coco feature-dump --input <odb_path> --layer <layer_name> --feature <id>
```

## Check Options

```bash
coco net-distance-batch --help
coco feature-dump --help
```
