python3 -m venv venv
./venv/bin/pip install -r requirements.txt
./venv/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

chmod +x venv/bin/activate
source ./venv/bin/activate