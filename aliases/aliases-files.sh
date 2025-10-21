# #!/bin/bash

# # I have a list of files in the current clipboard
# # For each file, a command will be executed using the file as the argument.

# # For instance, pbfoeach "mv ../"
# # assuming i have vai.json on my clipboard, the command will be mv ../vai.json ../

# function for_each_pb() {
#     FILES=$(pbpaste)
#     while IFS= read -r FILE; do
#         if [ -n "$FILE" ]; then
#             echo "Executing: $1 $FILE"
#             mv $FILE ../
#         fi
#     done <<< "$FILES"
# }

# alias for-each-pb="for_each_pb"

# 	# Attorney_Report_20250901_215928.xlsx
# 	# Otter_Users_Report_20250902_094351.xlsx
# 	# key-scan.py
# 	# otter.users.json
# 	# report.json
# 	# report_backup_20250901_215427.json
# 	# report_backup_20250901_215928.json
# 	# tools/demographic_report_20250901.json
# 	# tools/scripts/demographicReport.js
# 	# tools/scripts/other.js
# 	# tools/scripts/reportUserGeoAndPrivacy.js
# 	# tools/scripts/reportUserGeoAndPrivacyFields.js
# 	# tools/scripts/updateReport.js
# 	# tools/scripts/updateReportOtter.js