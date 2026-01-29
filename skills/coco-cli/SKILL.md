---
name: coco-cli
description: ODB++ PCB 설계 파일 분석 CLI. 레이어/넷/컴포넌트 조회, 피처 거리 측정, 넷 간격 분석, PNG 렌더링 지원.
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

## 설치

```bash
# 설치 확인
coco --help

# 설치되지 않은 경우
# Linux/macOS:
./scripts/install.sh
# Windows:
./scripts/install.ps1
```

## ODB++ 폴더 식별

ODB++ 폴더는 내부 구조로 식별 (폴더 이름은 무관):

```
<any_name>/       <- --input에 지정할 경로
├── matrix/
├── steps/
└── misc/
```

`matrix/`, `steps/`, `misc/` 폴더가 모두 있으면 ODB++ 루트.

## 명령어 사용법

**항상 `--help`로 최신 옵션을 확인하세요:**

```bash
# 전체 명령어 목록
coco --help

# 특정 명령어 옵션
coco <command> --help
```

### 주요 명령어

| 명령어 | 용도 |
|--------|------|
| `list-layers` | 레이어 목록 조회 |
| `list-nets` | 넷 목록 조회 |
| `list-components` | 컴포넌트 목록 조회 |
| `list-features` | 피처 목록 조회 |
| `measure` | 피처 간 거리 측정 |
| `net-distance` | 넷 간 최소 거리 |
| `net-length` | 넷 총 길이 계산 |
| `render` | 레이어 PNG 렌더링 |

### 공통 옵션

| 옵션 | 설명 |
|------|------|
| `--input <path>` | ODB++ 루트 디렉토리 (필수) |
| `--layer <name>` | 레이어 이름 |
| `--step <name>` | 스텝 이름 (보통 자동 감지) |
| `--format json` | JSON 출력 |

## 기본 작업 흐름

```bash
# 1. ODB++ 폴더 발견 시 먼저 레이어 확인
coco list-layers --input <odb_path>

# 2. 사용자 요청에 따라 상세 분석
coco <command> --help  # 옵션 확인 후 실행
```

## Use Cases

- [DFM 간격 검증](references/usecase-dfm.md)
- [넷 분석](references/usecase-net.md)

## 문제 해결

| 증상 | 해결 |
|------|------|
| command not found | `scripts/install.sh` 실행 |
| step not found | `--step <name>` 옵션 명시 |
