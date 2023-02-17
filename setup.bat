if not exist "venv" python -m venv venv
venv\Scripts\pip install -r requirements.txt
venv\Scripts\python -m jupyter nbextension enable --py --sys-prefix widgetsnbextension
venv\Scripts\Activate