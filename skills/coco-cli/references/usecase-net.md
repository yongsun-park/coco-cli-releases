# 넷 분석

특정 넷의 경로, 길이, 피처 분석.

## 작업 흐름

```bash
# 1. 넷 검색
coco list-nets --input <odb_path> --pattern "<pattern>"

# 2. 넷의 피처 조회
coco list-net-features --input <odb_path> --net <net_name> --layer <layer_name>

# 3. 넷 길이 계산
coco net-length --input <odb_path> --pattern "<net_pattern>"
```

## 옵션 확인

```bash
coco list-nets --help
coco list-net-features --help
coco net-length --help
```
