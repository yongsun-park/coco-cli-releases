# DFM 간격 검증

PCB 설계의 Design for Manufacturing (DFM) 간격 규칙 검증.

## 작업 흐름

```bash
# 1. 레이어 확인
coco list-layers --input <odb_path>

# 2. 넷 간격 검사 (특정 레이어)
coco net-distance-batch --input <odb_path> --layer <layer_name>

# 3. 문제 피처 상세 확인
coco feature-dump --input <odb_path> --layer <layer_name> --feature <id>
```

## 옵션 확인

```bash
coco net-distance-batch --help
coco feature-dump --help
```
