
# 📌 LLMTools - AI-Powered LLM Toolkit

LLMTools is a modular **Swift package** designed to integrate **local** and **cloud-based** Large Language Models (LLMs) with **AI-driven capabilities**, secure **OS command execution**, and **structured data extraction**.

---

## 🚀 **Features**
✅ **Local LLM Execution** - Uses `MLX-Swift` to run models locally.  
✅ **Cloud API Support** - OpenAI, Anthropic, and custom endpoints.  
✅ **Secure File System Access** - Restrict AI file operations to a defined root.  
✅ **Admin OS Command Execution** - Controlled, auditable system commands.  
✅ **Fine-Tuning Support** - Train custom models using datasets.  
✅ **Structured Data Extraction** - AI-powered Named Entity Recognition (NER).  
✅ **Logging & Debugging** - Secure API key storage & tool execution logs.  

---

## 📂 **Project Structure**
```
LLMTools/
│── Package.swift           # Swift Package Manager manifest
│── README.md               # Full package documentation
│── Sources/
│   │── LLMTools/
│   │   │── Core/           # Core processing (Local & Cloud LLMs)
│   │   │── Security/       # Secure storage, file access, and OS commands
│   │   │── AI_Features/    # NLP tools (NER, data extraction)
│   │   │── Utilities/      # Prompt optimization & caching
│   │   │── Tools/          # External AI tool management
│── Tests/
│   │── LLMToolsTests/      # Unit tests for each module
```

---

## ⚙️ **Installation**
LLMTools is distributed via **Swift Package Manager (SPM)**:

```swift
.package(url: "https://github.com/YOUR_GITHUB/LLMTools.git", from: "1.0.0")
```

Then, import it in your Swift project:

```swift
import LLMTools
```

---

## 🛠 **Usage Examples**

### 🔹 **1. Running a Local Model**
```swift
let localProcessor = LocalLLMProcessor.shared
try localProcessor.loadModel(modelPath: "path/to/model", useGPU: true)
let response = try localProcessor.generateResponse(prompt: "Explain Quantum Physics")
print(response)
```

### 🔹 **2. Making a Cloud API Request**
```swift
let cloudClient = CloudLLMClient(apiKey: "YOUR_OPENAI_KEY", endpoint: "https://api.openai.com/v1/chat")
cloudClient.sendRequest(prompt: "Summarize AI ethics") { response in
    print(response)
}
```

### 🔹 **3. Secure OS Command Execution**
```swift
let commandExecutor = OSCommandExecutor(allowExecution: true)
let result = try commandExecutor.execute(command: "ls /Users/")
print(result)
```

### 🔹 **4. Fine-Tuning a Model**
```swift
let fineTuner = FineTuning.shared
try fineTuner.fineTuneModel(modelPath: "path/to/model", datasetPath: "path/to/dataset.json", epochs: 5, learningRate: 0.01)
```

---

## 🔍 **Testing**
Run tests using `XCTest` in Xcode:

```sh
swift test
```

---

## 🔐 **Security & Best Practices**
- **API keys are encrypted** using Keychain (`SecureStorage.swift`).  
- **File system access is restricted** to a configurable root directory.  
- **OS command execution is disabled by default**—must be explicitly enabled.  
- **All actions are logged** for debugging and auditing.  

---

## 💡 **Contributing**
Feel free to submit **pull requests** and **issues**. Let's build AI-powered tools responsibly!  

For inquiries, contact: **your.email@domain.com**  

---

## 📜 **License**
This project is licensed under **MIT License**.
