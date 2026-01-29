# coco CLI 명령어 레퍼런스

## 공통 옵션

| 옵션 | 설명 | 기본값 |
|------|------|--------|
| `--input <path>` | ODB++ 루트 디렉토리 | 필수 |
| `--step <name>` | 스텝 이름 | 자동 선택 |
| `--format <type>` | 출력: json, pgeom, wkt | json |
| `--precision <n>` | 소수점 자릿수 | 6 |

---

## 설계 개요

### list-layers

```bash
coco list-layers --input <odb_root> [--pattern <regex>] [--limit <n>]
```

### list-components

```bash
coco list-components --input <odb_root> [--pattern <regex>] [--limit <n>]
```

### component-info

```bash
coco component-info --input <odb_root> --component <ref>
coco component-info --input <odb_root> --pattern <regex> [--limit <n>]
```

### list-nets

```bash
coco list-nets --input <odb_root> [--pattern <regex>] [--limit <n>]
```

---

## 넷 분석

### list-net-features

```bash
coco list-net-features --input <odb_root> --net <name> [--layer <name>]
```

### net-length

```bash
coco net-length --input <odb_root> --pattern <regex> [--limit <n>]
```

### net-distance

두 넷 간 최소 거리.

```bash
coco net-distance --input <odb_root> --layer <name> --net-a <name> --net-b <name> [--include-width]
```

출력: distance, closestPoints

### net-distance-batch

여러 넷 간격 일괄 측정.

```bash
coco net-distance-batch --input <odb_root> [--layer <name>] [--layers <a,b,c>] [--exclude-none]
```

| 옵션 | 설명 |
|------|------|
| `--exclude-none` | $NONE$ 넷 제외 |
| `--include-width` | 물리적 폭 포함 |

### net-overlap-batch

넷 간 쇼트 검출.

```bash
coco net-overlap-batch --input <odb_root> [--layer <name>] [--exclude-none]
```

---

## 피처 조회

### list-features

```bash
coco list-features --input <odb_root> --layer <name> [--limit <n>] [--offset <n>]
```

### feature-dump

피처 지오메트리 상세.

```bash
coco feature-dump --input <odb_root> --layer <name> --feature <id> [--format json|pgeom|wkt]
```

### feature-bounds

```bash
coco feature-bounds --input <odb_root> --layer <name> --feature <id>
```

### feature-at-point

```bash
coco feature-at-point --input <odb_root> --layer <name> --point <x,y> [--tolerance <mm>]
```

### feature-contains

```bash
coco feature-contains --input <odb_root> --layer <name> --feature <id> --point <x,y>
```

### feature-neighbors

```bash
coco feature-neighbors --input <odb_root> --layer <name> --feature <id> --radius <mm> [--exclude-same-net]
```

### bounds-query

```bash
coco bounds-query --input <odb_root> --layer <name> --bounds <minx,miny,maxx,maxy> [--net <name>]
```

---

## 측정

### measure

두 피처 간 거리.

```bash
coco measure --input <odb_root> --layer <name> --feature-a <id> --feature-b <id> [--include-width]
```

---

## Surface 분석

### surface-hole-dump

```bash
coco surface-hole-dump --input <odb_root> --layer <name> --surface <id> --hole-index <n>
```

### surface-hole-overlaps

```bash
coco surface-hole-overlaps --input <odb_root> --layer <name> --surface <id> --circle <id>
```

### surface-hole-overlaps-feature

```bash
coco surface-hole-overlaps-feature --input <odb_root> --layer <name> --surface <id> --feature <id>
```

### surface-hole-debug

```bash
coco surface-hole-debug --input <odb_root> --layer <name> --surface <id> --hole-index <n> --point <x,y>
```

---

## 시각화

### render

```bash
coco render --input <odb_root> --layer <name> --output <png> [options]
```

| 옵션 | 설명 | 기본값 |
|------|------|--------|
| `--width <px>` | 출력 너비 | 1024 |
| `--height <px>` | 출력 높이 | 1024 |
| `--color <#RRGGBB>` | 지오메트리 색상 | #33e68c |
| `--background <#RRGGBB>` | 배경 색상 | #000000 |
| `--view <minx,miny,maxx,maxy>` | 뷰 영역 | 자동 |

### scene-create

```bash
coco scene-create --input <odb_root> --net-pattern <regex> [options]
```

| 옵션 | 설명 |
|------|------|
| `--highlight-color <#RRGGBB>` | 하이라이트 색상 |
| `--component-pattern <regex>` | 컴포넌트 패턴 |
| `--layers <l1,l2>` | 표시할 레이어 |
| `--auto-layer-select` | 자동 레이어 선택 |
| `--auto-fit` | 자동 줌 |

---

## 라이선스

### license activate

```bash
coco license activate <serial>
```

### license mac-address

```bash
coco license mac-address [--all]
```

---

## 성능 옵션

| 옵션 | 설명 |
|------|------|
| `--timing` | 타이밍 정보 출력 |
| `--no-segment-index` | 세그먼트 인덱스 비활성화 (느려짐) |
| `--no-surface-polygon-rtree` | Surface R-Tree 비활성화 |
| `--no-overlap-rtree` | 오버랩 R-Tree 비활성화 |

> 기본값 사용 권장. `--no-*` 옵션은 디버깅용.
