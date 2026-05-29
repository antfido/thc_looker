## CONNECTION DEFINITION ###
connection: "@{project_connection}"

### POINT TO EXPLORES / DASHBOARDS ###
include: "/marketing/explores/mkt_orders.explore.lkml"
include: "/marketing/dashboards/marketing_dashboard.dashboard.lookml"

### DEFINE LABEL ###
label: "[Marketing] Orders & Sales"
