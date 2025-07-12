import subprocess

def yum_list_installed_to_md():
    result = subprocess.run(['yum', 'list', '--installed'], stdout=subprocess.PIPE, text=True)
    lines = result.stdout.strip().split('\n')

    packages = []
    for line in lines:
        if line.strip() == '' or line.startswith('Loaded plugins') or line.startswith('Installed Packages'):
            continue
        parts = line.split(None, 2)
        if len(parts) == 3:
            packages.append(parts)


    headers = ["Package", "Version", "Repository"]


    col_widths = [len(h) for h in headers]
    for pkg in packages:
        for i in range(3):
            col_widths[i] = max(col_widths[i], len(pkg[i]))

    md = []


    header_row = "| " + " | ".join(headers[i].ljust(col_widths[i]) for i in range(3)) + " |"
    md.append(header_row)


    separator_row = "|-" + "-|-".join('-' * col_widths[i] for i in range(3)) + "-|"
    md.append(separator_row)


    for pkg in packages:
        row = "| " + " | ".join(pkg[i].ljust(col_widths[i]) for i in range(3)) + " |"
        md.append(row)

    return "\n".join(md)

if __name__ == "__main__":
    md_table = yum_list_installed_to_md()
    filename = "installed_packages.md"
    with open(filename, "w") as f:
        f.write(md_table)
    print(f"Markdown table saved to {filename}")
