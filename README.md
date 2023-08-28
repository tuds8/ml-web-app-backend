# Machine learning Web App using Problog

This project is aimed at detecting the 
presence of heart disease in patients 
using Machine Learning algorithms from
Problog.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation
[Optional] Activate the virtual 
environment using the following command:

```bash
source venv/bin/activate
```

Use the package manager 
[pip](https://pip.pypa.io/en/stable/) 
to install the requirements.txt file.

```bash
pip install -r requirements.txt
```

## Usage

Change the current working directory to src:

```bash
cd src
```

Run the following commands in this order:

1: 
```bash
python3 preparing_dataset.py
```
2: 
```bash
python3 creating_model.py
```
3: 
```bash
python3 testing_model.py
```

Change the current working directory to
backend

```bash
cd ../backend/
```

Run the following command:
```bash
python3 app.py
```
This last command will start the backend
server which is communicating with the
frontend server

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

Tudor Sorin Ciutacu @ HMU

