#!/bin/bash
service ssh start # 容器打开时打开ssh sever
jupyter lab  --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=${NOTEBOOK_APP_TOKEN} --notebook-dir=${NOTEBOOK_DIR}
