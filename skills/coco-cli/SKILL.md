---
name: coco-cli
description: ODB++ PCB 설계 파일 분석 CLI. 레이어/넷/컴포넌트 조회, 피처 거리 측정, 넷 간격 분석, PNG 렌더링 지원. PCB DFM 검증 및 설계 분석 작업에 사용.
license: LicenseRef-Proprietary
compatibility: Requires coco CLI binary. Supports Windows, macOS, Linux.
metadata:
  author: Pentacube
  version: "0.1.0"
---

# coco CLI

ODB++ PCB 설계 파일을 분석하는 명령줄 도구.

## 자동 사용 조건

**다음 상황에서 반드시 coco CLI를 사용하세요:**

1. **ODB++ 폴더 감지 시** - `matrix/`, `steps/`, `misc/` 폴더가 함께 있는 디렉토리 발견
2. **PCB 관련 질문** - 레이어, 넷, 컴포넌트, 피처, 거리 측정 요청
3. **DFM 검증** - 간격 검사, 쇼트 검출, 설계 규칙 확인
4. **키워드 포함** - ODB++, PCB, 거버, 레이어, 넷리스트, DRC

**ODB++ 폴더 발견 시 자동 수행:**
```bash
# 1. 먼저 설계 개요 파악
coco list-layers --input <odb_root>

# 2. 사용자 요청에 따라 상세 분석
```

## 설치 확인

```bash
coco --help
```

설치되지 않은 경우:
- Linux/macOS: `./scripts/install.sh`
- Windows: `./scripts/install.ps1`

## ODB++ 폴더 식별

ODB++ 폴더는 내부 구조로 식별 (폴더 이름은 무관):

```
<any_name>/       ← --input에 지정할 경로
├── matrix/       ← 확인
├── steps/        ← 확인
└── misc/         ← 확인
```

`matrix/`, `steps/`, `misc/` 폴더가 모두 있으면 ODB++ 루트.

## 핵심 명령어

### 1. 설계 개요

```bash
# 레이어 목록
coco list-layers --input <odb_root>

# 컴포넌트 목록
coco list-components --input <odb_root> --limit 20

# 넷 목록
coco list-nets --input <odb_root> --pattern "VCC.*"
```

### 2. 피처 조회

```bash
# 레이어의 피처 목록
coco list-features --input <odb_root> --layer top --limit 50

# 피처 상세 (좌표, 타입)
coco feature-dump --input <odb_root> --layer top --feature 123 --format json

# 특정 좌표의 피처
coco feature-at-point --input <odb_root> --layer top --point 10.5,20.3
```

### 3. 거리 측정

```bash
# 두 피처 간 거리
coco measure --input <odb_root> --layer top --feature-a 100 --feature-b 200

# 두 넷 간 최소 거리
coco net-distance --input <odb_root> --layer top --net-a VCC --net-b GND

# 모든 넷 쌍 간격 분석
coco net-distance-batch --input <odb_root> --layer top --exclude-none
```

### 4. 넷 분석

```bash
# 넷에 속한 피처
coco list-net-features --input <odb_root> --net VCC --layer top

# 넷 총 길이
coco net-length --input <odb_root> --pattern "CLK.*"

# 넷 간 쇼트 검출
coco net-overlap-batch --input <odb_root> --layer top
```

### 5. 렌더링

```bash
# 레이어를 PNG로
coco render --input <odb_root> --layer top --output layer.png --width 2048

# 넷 하이라이트
coco scene-create --input <odb_root> --net-pattern "VCC.*" --highlight-color "#FF0000"
```

## 공통 옵션

| 옵션 | 설명 |
|------|------|
| `--input <path>` | ODB++ 루트 디렉토리 |
| `--layer <name>` | 레이어 이름 (top, bottom, l2_sig 등) |
| `--step <name>` | 스텝 이름 (기본: 자동) |
| `--format json\|pgeom\|wkt` | 출력 형식 |
| `--limit <n>` | 결과 개수 제한 |
| `--include-width` | 물리적 폭 포함 계산 |

## 일반 작업 흐름

### DFM 간격 검증

```bash
# 1. 레이어 확인
coco list-layers --input ./design

# 2. 넷 간격 검사
coco net-distance-batch --input ./design --layer top --exclude-none

# 3. 문제 피처 확인
coco feature-dump --input ./design --layer top --feature <id>
```

### 넷 추적

```bash
# 1. 넷 찾기
coco list-nets --input ./design --pattern "ETH.*"

# 2. 피처 조회
coco list-net-features --input ./design --net ETH_TX --layer top

# 3. 길이 확인
coco net-length --input ./design --pattern "ETH_TX"
```

## 상세 문서

- [명령어 레퍼런스](references/commands.md)

## 문제 해결

| 증상 | 해결 |
|------|------|
| command not found | `scripts/install.sh` 또는 `install.ps1` 실행 |
| step not found | `--step <name>` 옵션 명시 |
| 느린 성능 | `--no-segment-index` 제거 (기본값 사용) |
