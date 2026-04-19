# 🐡 OpenBabelFish

A high-performance, fully-offline translation appliance. **OpenBabelFish** is designed for users who need professional-grade translation without compromising privacy or relying on cloud providers.

![OpenBabelFish CLI](https://img.shields.io/badge/Interface-Rich--CLI-brightgreen)
![Engine](https://img.shields.io/badge/Engine-CTranslate2-blue)
![Model](https://img.shields.io/badge/Model-NLLB--200-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🚀 Key Features

- **Local-First**: Complete privacy. No internet connection is used for translation.
- **Deep Translation Engine**: Powered by Meta's NLLB-200 (No Language Left Behind) models.
- **Hardware Optimized**: Supports seamless switching between CPU and NVIDIA GPU (CUDA) acceleration.
- **Smart Model Management**: Automatically downloads and manages model variants (600M, 1.3B, 3.3B).
- **Interactive REPL**: A beautiful, colorized shell interface for real-time translation and configuration.

## 🛠 Installation

### Prerequisites
- Python 3.10+
- (Optional) NVIDIA GPU for CUDA acceleration

### Quick Start
1. Clone the repository:
   ```bash
   git clone https://github.com/MdHu55a1n/OpenBabelFish.git
   cd OpenBabelFish
   ```
2. Run the automated launcher:
   ```bash
   run_openbabelfish.bat
   ```
   *The launcher will automatically create a virtual environment, install dependencies, and guide you through the first-run configuration.*

## 💻 Usage

### Command Line Mode
```bash
openbabelfish --to spanish -f document.txt
```

### Options
- `--to [lang]`: Target language (Required)
- `--from [lang]`: Source language (Auto-detected if omitted)
- `-f, --file [path]`: Read input from a file
- `-o, --output [path]`: Save translation to a file
- `--gpu / --cpu`: Force specific hardware mode
- `--models`: Show and manage downloaded model variants

### Interactive Shell
Simply run `openbabelfish` (or `run_openbabelfish.bat`) with no arguments to enter the interactive shell.

## 📜 License
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments
- **Meta AI** for the NLLB-200 models.
- **OpenNMT** for the CTranslate2 inference engine.
- **Rich** for the stunning terminal UI components.
