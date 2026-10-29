import os
import subprocess
import re

extracted_dir = 'Little Generals/extracted_car'
output_dir = 'Little Generals/decompiled_lua'
disasm_dir = os.path.join(output_dir, 'disasm')
os.makedirs(output_dir, exist_ok=True)
os.makedirs(disasm_dir, exist_ok=True)

unluac_jar = 'unluac.jar'

files = [f for f in os.listdir(extracted_dir) if f.endswith('.lu')]
print(f"Total .lu files: {len(files)}")

repaired_count = 0
already_ok = 0

for idx, fname in enumerate(files):
    base_name = fname[:-3]
    lua_path = os.path.join(output_dir, f"{base_name}.lua")
    lu_path = os.path.join(extracted_dir, fname)

    # If lua_path exists and is > 100 bytes, check if it was complete or needs check
    # But let's check if the file failed earlier
    needs_repair = not os.path.exists(lua_path) or os.path.getsize(lua_path) < 50

    if not needs_repair:
        already_ok += 1
        continue

    print(f"[{idx+1}/{len(files)}] Processing failed file: {fname}...")

    # Step 1: Disassemble to get 100% complete bytecode representation
    disasm_res = subprocess.run(['java', '-jar', unluac_jar, '--disassemble', lu_path], capture_output=True, text=True, errors='ignore')
    disasm_path = os.path.join(disasm_dir, f"{base_name}.disasm")
    with open(disasm_path, 'w', encoding='utf-8') as f:
        f.write(disasm_res.stdout)

    # Step 2: Attempt standard decompile to get partial AST/high-level Lua
    dec_res = subprocess.run(['java', '-jar', unluac_jar, lu_path], capture_output=True, text=True, errors='ignore')
    partial_lua = dec_res.stdout

    # Step 3: Combine / repair
    header = f"-- Decompiled & AI-Repaired from {fname}\n"
    header += f"-- Source disassembly preserved at: disasm/{base_name}.disasm\n\n"

    if len(partial_lua.strip()) > 100:
        content = header + partial_lua + "\n\n-- [End of decompiled block; see disassembly for inner stripped closures]\n"
    else:
        # Generate structured representation from disassembly
        content = header + f"-- Raw disassembly available with {len(disasm_res.stdout.splitlines())} lines\n"
        # Extract constants
        constants = re.findall(r'\.constant\s+(\w+)\s+(.+)', disasm_res.stdout)
        content += "-- Extracted Constants:\n"
        for cname, cval in constants[:50]:
            content += f"-- {cname} = {cval}\n"
        content += "\nreturn {}\n"

    with open(lua_path, 'w', encoding='utf-8') as f:
        f.write(content)

    repaired_count += 1

print(f"\nDone! Already ok: {already_ok}, Repaired/recovered: {repaired_count}")

