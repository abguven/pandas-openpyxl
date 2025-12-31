# Ultra-lightweight Pandas & OpenPyXL Image

[![Docker Image Size](https://img.shields.io/docker/image-size/abguven/pandas-openpyxl/latest)](https://hub.docker.com/r/abguven/pandas-openpyxl)
[![Python Version](https://img.shields.io/badge/python-3.11--slim-blue)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

This is a high-performance, minimalist Docker image designed for Data Engineers who need to process CSV and Excel files in automated pipelines (Kestra, Airflow, GitHub Actions).

Most data science images are bloated (1GB+). This image is built on **Python 3.11-slim** to keep it under **90MB**, reducing deployment time and storage costs.

## Why this image?

* **No Bloat:** Only contains `pandas` and `openpyxl`. No unnecessary data science libraries.
* **Fast Deployment:** Smaller size means faster "pulls" in your CI/CD or Orchestrator.
* **Security:** Built on stable Debian-slim to minimize the attack surface.
* **Transparent:** Full Dockerfile available on GitHub.

## Tech Stack

* **Base:** `python:3.11-slim`
* **Core:** `pandas` (Latest)
* **Excel Engine:** `openpyxl` (Latest)

## Usage

### In Kestra (Orchestrator)

```yaml
tasks:
  - id: process_data
    type: io.kestra.plugin.scripts.python.Script
    taskRunner:
      type: io.kestra.plugin.scripts.runner.docker.Docker
    containerImage: abguven/pandas-openpyxl:latest
    script: |
      import pandas as pd
      df = pd.read_excel('data.xlsx')
      print(df.head())
```

### Locally

```bash
docker pull abguven/pandas-openpyxl:latest
docker run -it abguven/pandas-openpyxl:latest python3
```

## Contributing

Feel free to open issues or pull requests to keep this image updated and efficient.

---
**Maintained by [abguven](https://github.com/abguven)**
