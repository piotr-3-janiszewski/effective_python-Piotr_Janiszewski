#!/usr/bin/env bash
# Launch JupyterLab for this project, creating the virtual environment on first run.
# Usage: ./run_jupyter.sh [extra jupyter lab args, e.g. part09_pandas.ipynb]
set -euo pipefail

cd "$(dirname "$0")"

if [ ! -x .venv/bin/jupyter ]; then
    echo "Setting up .venv (first run)..."
    uv venv
    uv pip install --python .venv/bin/python \
        jupyterlab numpy pandas matplotlib scikit-learn numba cython tqdm rich django
fi

exec .venv/bin/jupyter lab "$@"
