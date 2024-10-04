_MY_JIRA_ID_G="712020%3A75fcd2ef-7606-444a-9a18-12ea4bdeb589"
_JIRA_G_URL="https://drivekyte.atlassian.net/jira/software/c/projects/GE/boards/14?assignee=$_MY_JIRA_ID_G"

alias issues-ge='chrome "$_JIRA_G_URL"'
alias growth-issues='issues-ge'

alias run-web='cd ~/projects/kyte/frontend-monorepo/apps/consumer-web; pwd; yarn dev'
