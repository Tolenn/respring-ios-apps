---
name: ai-decompilation
description: AI-assisted decompilation, disassembly analysis, and decompiler repair using DAILA, DecompAI, and multi-stage bytecode reconstruction for Android APKs, Corona/Solar2D Lua resources, and binary assets.
---

# AI-Assisted Decompilation & Reverse Engineering

This skill provides automated methodologies and tooling for resolving broken, stripped, or incomplete decompilations when porting legacy Android APKs and iOS binaries.

## Key Tool Integrations

### 1. DAILA (Decompiler Artificially Intelligent Language Assistant)
- **Repository**: `tools/DAILA` (`https://github.com/mahaloz/DAILA`)
- **Capability**: Unified interface connecting LLMs (OpenAI, Claude, Gemini, local models) with decompilers (IDA Pro, Ghidra, Binary Ninja, angr).
- **Use Cases**:
  - Semantic variable and function renaming for obfuscated identifiers (`L0_0`, `L1_1`, `A0_16`).
  - Struct and type recovery from stripped symbol tables.
  - Explaining complex mathematical/ballistic physics routines.

### 2. DecompAI
- **Repository**: `tools/decompai` (`https://github.com/louisgthier/decompai`)
- **Capability**: LangGraph & ReAct agent automating binary analysis, disassembly summarization, and step-by-step code synthesis.
- **Use Cases**:
  - High-level pseudocode generation from partial disassembly.
  - Reconstructing broken control flow graphs and loop structures.

### 3. Multi-Stage Lua Bytecode Recovery Pipeline
- **Script**: `scripts/ai_decompile_repair.py`
- **Workflow**:
  1. **Disassembly Ground Truth**: Run `unluac --disassemble <file.lu>` to obtain 100% complete bytecode opcodes, constants, function prototypes, and register allocations without crashing on stripped metadata.
  2. **High-Level AST Extraction**: Run standard `unluac` to extract outer block assignments, tables, and top-level definitions.
  3. **AI Decompilation Repair**: Synthesize the complete decompiled Lua source file, resolving inner stripped closures using the exact disassembly opcodes.

## Verifying Decompiled Assets
Run the automated validator to ensure 100% of compiled game assets are extracted, decompiled, and verified:
```bash
python scripts/ai_decompile_repair.py
python scripts/validate_package.py
```

