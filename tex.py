import subprocess
import xml.etree.ElementTree as ET
import sys

trace_file = sys.argv[1]  # your .trace file

# Export to XML using specific XPath for counters data
result = subprocess.run(
    ["xcrun", "xctrace", "export", "--input", trace_file, "--xpath", '/trace-toc/run[@number="1"]/data/table[@schema="counters-profile"]'],
    capture_output=True,
    text=True
)

# Counter names in order
counter_names = [
    "Cycles",
    "L1D_CACHE_MISS_LD",
    "L1D_CACHE_MISS_ST", 
    "L2_TLB_MISS_DATA",
    "L2_TLB_MISS_INSTRUCTION",
    "BRANCH_MISPRED_NONSPEC",
    "Instructions"
]

# Parse the XML and sum up counter values
totals = [0] * len(counter_names)
sample_count = 0

try:
    root = ET.fromstring(result.stdout)
    for elem in root.iter():
        if elem.tag == 'pmc-events':
            values = elem.text.strip().split()
            for i, value in enumerate(values):
                totals[i] += int(value)
            sample_count += 1
    
    # Print totals
    print("Total counters across all samples:")
    for name, total in zip(counter_names, totals):
        print(f"{name}: {total}")
    print(f"\nTotal samples: {sample_count}")
    
    # Calculate derived metrics
    cycles = totals[0]
    l1d_ld = totals[1]
    l1d_st = totals[2]
    l2_tlb_data = totals[3]
    l2_tlb_inst = totals[4]
    branch_mispred = totals[5]
    instructions = totals[6]
    
    cpi = cycles / instructions if instructions > 0 else 0
    ipc = instructions / cycles if cycles > 0 else 0
    l1_miss_rate = (l1d_ld + l1d_st) / instructions if instructions > 0 else 0
    l2_tlb_miss_rate = (l2_tlb_data + l2_tlb_inst) / instructions if instructions > 0 else 0
    branch_mispred_rate = branch_mispred / instructions if instructions > 0 else 0
    
    print("\nDerived Metrics:")
    print(f"CPI (Cycles per Instruction): {cpi:.4f}")
    print(f"IPC (Instructions per Cycle): {ipc:.4f}")
    print(f"L1 Data Cache Miss Rate: {l1_miss_rate:.6f}")
    print(f"L2 TLB Miss Rate: {l2_tlb_miss_rate:.6f}")
    print(f"Branch Mispredictions per Instruction: {branch_mispred_rate:.6f}")
    
except Exception as e:
    print(f"Error parsing XML: {e}")
    print(result.stdout[:2000])
