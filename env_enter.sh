python3 -m venv venv
# find GPU
gpu=$(lspci | grep -i '.* vga .* nvidia .*')

# if envidia is pressent assume that we can install torch GPU
if [[ $gpu == *' nvidia '* ]]; then
    printf 'Nvidia GPU is present:  %s\n' "$gpu"
    ./venv/bin/pip install -r environment/requirements_torch_gpu.txt
else
    printf 'Nvidia GPU is not present cpu only!\n'
    ./venv/bin/pip install -r environment/requirements_torch_cpu.txt
fi

./venv/bin/pip install -r environment/requirements.txt

./venv/bin/python3 -m jupyter nbextension enable --py --sys-prefix widgetsnbextension

chmod +x venv/bin/activate
source ./venv/bin/activate