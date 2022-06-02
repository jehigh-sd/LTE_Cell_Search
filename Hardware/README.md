# RFSoC 2x2 Based Lte Cell Search

Step 1: 
Download PYNQ Base Overlay for RFSoC2x2: See the RFSoC 2x2 base overlay page for more details.
https://www.rfsoc-pynq.io/base_overlay.html


Step 2:
Copy LTE Cell Search IPs:
--> FROM: [VIVADO\board\ip] TO [RFSoC2x2-PYNQ-master\board\ip]

Step 3:
Copy LTE Cell Search Scripts:
--> FROM: [VIVADO\board\RFSoC2x2\base] TO [RFSoC2x2-PYNQ-master\board\RFSoC2x2\base]

Step 4:
Create Project and Block Diagram:
--> CD to [RFSoC2x2-PYNQ-master\board\RFSoC2x2\base]
--> RUN script [source lteCellSearch.tcl]

Step 5:
Close Project
--> RUN Command [close_project]

Step 6:
Build Bitstream:
--> RUN script [source build_lteCellSearch.tcl]
