"""
Auto-generate LookML view files from a BigQuery dataset.
Usage: python generate_lookml_views.py
Output:
  - 1_raw/  : one .view.lkml per table with full dimension/measure definitions
  - 2_basic/: one .view.lkml per table that includes the 1_raw view and
              refines it (hidden_by_default + empty dimension stubs)
"""

from google.cloud import bigquery
import os

# ── Config ────────────────────────────────────────────────────────────────────
PROJECT    = "astrafy-dbt-demo"
DATASET    = "transformed"
BASE_DIR   = os.path.expanduser("~/Desktop/thc/marketing/views")
RAW_DIR    = os.path.join(BASE_DIR, "1_raw")
BASIC_DIR  = os.path.join(BASE_DIR, "2_basic")
# ─────────────────────────────────────────────────────────────────────────────

# BigQuery → LookML type mapping
BQ_TO_LOOKML = {
    "STRING":     "string",
    "BYTES":      "string",
    "INTEGER":    "number",
    "INT64":      "number",
    "FLOAT":      "number",
    "FLOAT64":    "number",
    "NUMERIC":    "number",
    "BIGNUMERIC": "number",
    "BOOLEAN":    "yesno",
    "BOOL":       "yesno",
    "DATE":       "date",
    "DATETIME":   "time",
    "TIMESTAMP":  "time",
    "TIME":       "string",
    "GEOGRAPHY":  "string",
    "JSON":       "string",
}


def bq_type_to_lookml(field_type: str) -> str:
    return BQ_TO_LOOKML.get(field_type.upper(), "string")


def generate_dimension(field) -> str:
    lookml_type = bq_type_to_lookml(field.field_type)

    if lookml_type in ("date", "time"):
        return (
            f"  dimension_group: {field.name} {{\n"
            f"    type: time\n"
            f"    timeframes: [raw, date, week, month, quarter, year]\n"
            f"    datatype: {'date' if lookml_type == 'date' else 'timestamp'}\n"
            f"    sql: ${{TABLE}}.{field.name} ;;\n"
            f"  }}\n"
        )
    else:
        primary_key = "yes" if field.name.lower() in ("id", f"{field.name}_id") else None
        pk_line = "    primary_key: yes\n" if primary_key else ""
        return (
            f"  dimension: {field.name} {{\n"
            f"    type: {lookml_type}\n"
            f"{pk_line}"
            f"    sql: ${{TABLE}}.{field.name} ;;\n"
            f"  }}\n"
        )


def generate_view(table_ref, schema) -> str:
    table_id = table_ref.table_id
    lines = []
    lines.append(f"view: {table_id} {{")
    lines.append(f"  sql_table_name: `{PROJECT}.{DATASET}.{table_id}` ;;\n")

    for field in schema:
        # Skip RECORD/STRUCT fields (nested) for now
        if field.field_type in ("RECORD", "STRUCT"):
            lines.append(f"  # Skipped nested field: {field.name} (RECORD)")
            continue
        lines.append(generate_dimension(field))

    lines.append("  measure: count {")
    lines.append("    type: count")
    lines.append("  }")
    lines.append("}")
    return "\n".join(lines)


def generate_basic_view(table_ref, schema) -> str:
    """Generate a 2_basic refinement view that includes the 1_raw view."""
    table_id = table_ref.table_id
    include_path = f"/marketing/views/1_raw/{table_id}.view.lkml"

    lines = []
    lines.append(f'include: "{include_path}"')
    lines.append(f"")
    lines.append(f"view: +{table_id} {{")
    lines.append(f"  hidden_by_default: yes")
    lines.append(f"")

    for field in schema:
        if field.field_type in ("RECORD", "STRUCT"):
            continue
        lookml_type = bq_type_to_lookml(field.field_type)
        if lookml_type in ("date", "time"):
            lines.append(f"  dimension_group: {field.name} {{ }}")
        else:
            lines.append(f"  dimension: {field.name} {{ }}")

    lines.append("}")
    return "\n".join(lines)


def main():
    client = bigquery.Client(project=PROJECT)
    os.makedirs(RAW_DIR, exist_ok=True)
    os.makedirs(BASIC_DIR, exist_ok=True)

    dataset_ref = client.dataset(DATASET)
    tables = list(client.list_tables(dataset_ref))

    if not tables:
        print(f"No tables found in {PROJECT}.{DATASET}")
        return

    print(f"Found {len(tables)} table(s) in {PROJECT}.{DATASET}\n")

    for table_ref in tables:
        table = client.get_table(table_ref)
        filename = f"{table_ref.table_id}.view.lkml"

        # 1_raw
        raw_content = generate_view(table_ref, table.schema)
        with open(os.path.join(RAW_DIR, filename), "w") as f:
            f.write(raw_content)
        print(f"  ✓ 1_raw/{filename}")

        # 2_basic
        basic_content = generate_basic_view(table_ref, table.schema)
        with open(os.path.join(BASIC_DIR, filename), "w") as f:
            f.write(basic_content)
        print(f"  ✓ 2_basic/{filename}")

    print(f"\nDone! Files written to: {BASE_DIR}")


if __name__ == "__main__":
    main()